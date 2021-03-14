using DataAccess;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Http;
using System.Web.UI.WebControls;

namespace EmployeeManagementApi.Controllers
{
    public class EmployeeManagementController : ApiController
    {
        employee_managementEntities Context = new employee_managementEntities();

        [Route("api/login")]
        public HttpResponseMessage GetLoginDetails(string email, string pass, string type)
        {
            try
            {
                if (type == "admin")
                {
                    var entities = from a in Context.admins
                                   where a.email == email && a.password == pass
                                   select new
                                   {
                                       id = a.admin_id,
                                       first_name = a.first_name,
                                       last_name = a.last_name,
                                       email = a.email,
                                       contact = a.contact,
                                       type = "admin"
                                   };
                    if (entities != null)
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, entities);
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                    }
                }
                else if (type == "employee")
                {
                    var entities = from a in Context.employees
                                   where a.email == email && a.password == pass
                                   select new
                                   {
                                       id = a.employee_id,
                                       first_name = a.first_name,
                                       last_name = a.last_name,
                                       email = a.email,
                                       contact = a.contact,
                                       type = "employee"
                                   };
                    if (entities != null)
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, entities);
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                    }
                }
                else if (type == "client")
                {
                    var entities = from a in Context.clients
                                   where a.email == email && a.password == pass
                                   select new
                                   {
                                       id = a.client_id,
                                       first_name = a.first_name,
                                       last_name = a.last_name,
                                       email = a.email,
                                       contact = a.contact,
                                       type = "client"
                                   };
                    if (entities != null)
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, entities);
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                    }
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }

            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/upcoming_jobs")]
        public HttpResponseMessage GetUpcomingJobs()
        {
            try
            {
                var entities = from j in Context.jobs
                               join c in Context.clients on j.client_id equals c.client_id
                               where j.job_status == "upcoming"
                               select new
                               {
                                   job_id = j.job_id,
                                   job_title = j.job_title,
                                   job_details = j.job_details,
                                   job_start_date = j.job_start_date,
                                   job_end_date = j.job_end_date,
                                   job_duration = j.job_duration,
                                   job_type = j.job_type,
                                   job_shift = j.job_shift,
                                   job_location = j.job_location,
                                   client_id = c.client_id,
                                   client_name = c.first_name + " " + c.last_name
                               };
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/upcoming_jobs/{id}")]
        public HttpResponseMessage GetUpcomingJobsByID(int id)
        {
            try
            {
                var entities = Context.jobs.FirstOrDefault(e => e.job_id == id);
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/upcoming_jobs")]
        public HttpResponseMessage PostJobs([FromBody] job entities)
        {
            try
            {
                Context.jobs.Add(entities);
                Context.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Data inserted successfully");
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/upcoming_jobs/{id}")]
        public HttpResponseMessage PutJobs(int id, [FromBody] job entities)
        {
            try
            {
                var entity = Context.jobs.FirstOrDefault(e => e.job_id == id);
                if (entity != null)
                {
                    entity.job_title = entities.job_title;
                    entity.job_details = entities.job_details;
                    entity.job_start_date = entities.job_start_date;
                    entity.job_end_date = entities.job_end_date;
                    entity.job_duration = entities.job_duration;
                    entity.job_type = entities.job_type;
                    entity.job_shift = entities.job_shift;
                    entity.job_location = entities.job_location;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Data updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/upcoming_jobs/{id}")]
        public HttpResponseMessage DeleteJobs(int id)
        {
            try
            {
                var entity = Context.jobs.FirstOrDefault(e => e.job_id == id);
                if (entity != null)
                {
                    Context.jobs.Remove(entity);
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Job has been deleted successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Invalid Job ID");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/unassigned_employees")]
        public HttpResponseMessage GetUnassignedEmployees()
        {
            try
            {
                var entities = from e in Context.employees
                               where e.status == "unassigned"
                               select new
                               {
                                   id = e.employee_id,
                                   name = e.first_name + " " + e.last_name,
                               };

                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/assigned_employees_from_jobs_log")]
        public HttpResponseMessage GetAssignedEmployeesFromJobsLog()
        {
            try
            {
                var entities = from un in Context.employees
                               join jl in Context.jobs_log on un.employee_id equals jl.employee_id
                               join j in Context.jobs on jl.job_id equals j.job_id
                               //where un.status == "unassigned"
                               select new
                               {
                                   id = un.employee_id,
                                   name = un.first_name + " " + un.last_name,
                                   start_date = j.job_start_date,
                                   end_date = j.job_end_date
                               };

                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/assign_employee_to_job")]
        public HttpResponseMessage PostAssignEmployeeToJob([FromBody] jobs_log entities)
        {
            try
            {
                var entity = Context.employees.FirstOrDefault(e => e.employee_id == entities.employee_id);
                entity.status = "assigned";
                Context.jobs_log.Add(entities);
                Context.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Data inserted successfully");
            }
            catch (Exception)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/assigned_employees/{id}")]
        public HttpResponseMessage GetAssignedEmployees(int id)
        {
            try
            {
                var entities = from e in Context.employees
                               join j in Context.jobs_log on e.employee_id equals j.employee_id
                               where j.job_id == id
                               select new
                               {
                                   id = e.employee_id,
                                   name = e.first_name + " " + e.last_name
                               };
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/assigned_employees/{id}")]
        public HttpResponseMessage DeleteAssignedEmployees(int id)
        {
            try
            {
                var job_log_entity = Context.jobs_log.FirstOrDefault(e => e.employee_id == id);
                var employee_entity = Context.employees.FirstOrDefault(e => e.employee_id == id);
                if (job_log_entity != null)
                {
                    employee_entity.status = "unassigned";
                    Context.jobs_log.Remove(job_log_entity);
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Client has been deleted successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Invalid client ID");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/running_jobs")]
        public HttpResponseMessage GetRunningJobs()
        {
            try
            {
                var entities = from j in Context.jobs
                               join c in Context.clients on j.client_id equals c.client_id
                               where j.job_status == "running"
                               select new
                               {
                                   job_id = j.job_id,
                                   job_title = j.job_title,
                                   job_details = j.job_details,
                                   job_start_date = j.job_start_date,
                                   job_end_date = j.job_end_date,
                                   job_type = j.job_type,
                                   job_shift = j.job_shift,
                                   job_location = j.job_location,
                                   client_id = c.client_id,
                                   client_name = c.first_name + " " + c.last_name
                               };
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/completed_jobs")]
        public HttpResponseMessage GetCompletedJobs()
        {
            try
            {
                var entities = from j in Context.jobs
                               join c in Context.clients on j.client_id equals c.client_id
                               where j.job_status == "completed"
                               select new
                               {
                                   job_id = j.job_id,
                                   job_title = j.job_title,
                                   job_details = j.job_details,
                                   job_start_date = j.job_start_date,
                                   job_end_date = j.job_end_date,
                                   job_duration = j.job_duration,
                                   job_type = j.job_type,
                                   job_shift = j.job_shift,
                                   job_location = j.job_location,
                                   client_id = c.client_id,
                                   client_name = c.first_name + " " + c.last_name
                               };
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/change_job_status")]
        public HttpResponseMessage PutChangeJobStatus([FromBody] job entities)
        {
            try
            {
                var entity = Context.jobs.FirstOrDefault(e => e.job_id == entities.job_id);
                var job_log_entities = Context.jobs_log.ToList();
                if (entity != null)
                {
                    entity.job_status = entities.job_status;
                    foreach (var item in job_log_entities)
                    {
                        if (item.job_id == entities.job_id)
                        {
                            item.status = entities.job_status.ToString();
                        }
                    }
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Data updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/upcoming_jobs_for_employee/{id}")]
        public HttpResponseMessage GetUpcomingJobsForEmployee(int id)
        {
            try
            {
                var entities = from jl in Context.jobs_log
                               join e in Context.employees on jl.employee_id equals e.employee_id
                               join j in Context.jobs on jl.job_id equals j.job_id
                               join c in Context.clients on j.client_id equals c.client_id
                               where jl.employee_id == id && j.job_status == "upcoming"
                               select new
                               {
                                   job_id = j.job_id,
                                   job_title = j.job_title,
                                   job_details = j.job_details,
                                   job_start_date = j.job_start_date,
                                   job_end_date = j.job_end_date,
                                   job_duration = j.job_duration,
                                   job_type = j.job_type,
                                   job_shift = j.job_shift,
                                   job_location = j.job_location,
                                   client_id = c.client_id,
                                   client_name = c.first_name + " " + c.last_name
                               };
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/running_jobs_for_employee/{id}")]
        public HttpResponseMessage GetRunningJobsForEmployee(int id)
        {
            try
            {
                var entities = from jl in Context.jobs_log
                               join e in Context.employees on jl.employee_id equals e.employee_id
                               join j in Context.jobs on jl.job_id equals j.job_id
                               join c in Context.clients on j.client_id equals c.client_id
                               where jl.employee_id == id && j.job_status == "running"
                               select new
                               {
                                   job_id = j.job_id,
                                   job_title = j.job_title,
                                   job_details = j.job_details,
                                   job_end_date = j.job_end_date,
                                   job_type = j.job_type,
                                   job_shift = j.job_shift,
                                   job_location = j.job_location,
                                   client_id = c.client_id,
                                   client_name = c.first_name + " " + c.last_name
                               };
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/completed_jobs_for_employee/{id}")]
        public HttpResponseMessage GetCompletedJobsForEmployee(int id)
        {
            try
            {
                var entities = from jl in Context.jobs_log
                               join e in Context.employees on jl.employee_id equals e.employee_id
                               join j in Context.jobs on jl.job_id equals j.job_id
                               join c in Context.clients on j.client_id equals c.client_id
                               where jl.employee_id == id && j.job_status == "completed"
                               select new
                               {
                                   job_id = j.job_id,
                                   job_title = j.job_title,
                                   job_details = j.job_details,
                                   job_start_date = j.job_start_date,
                                   job_end_date = j.job_end_date,
                                   job_duration = j.job_duration,
                                   job_type = j.job_type,
                                   job_shift = j.job_shift,
                                   client_id = c.client_id,
                                   client_name = c.first_name + " " + c.last_name
                               };
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }



        [Route("api/sick_leaves/{emp_id}/{job_id}")]
        public HttpResponseMessage GetSickLeaves(int emp_id, int job_id)
        {
            try
            {
                var entities = from e in Context.employee_sick_leaves
                               where e.employee_id == emp_id && e.job_id == job_id
                               select new
                               {
                                   sick_leave_id = e.sick_leave_id,
                                   start_date = e.start_date,
                                   end_date = e.end_date,
                                   medical_document = e.medical_document,
                                   employee_id = e.employee_id,
                                   job_id = e.job_id
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
                //if (entities != null)
                //{
                //return Request.CreateResponse(HttpStatusCode.OK, entities);
                //}
                //else
                //{
                //    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                //}
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/sick_leaves")]
        public HttpResponseMessage PostSickLeaves([FromBody] employee_sick_leaves entities)
        {
            try
            {
                Context.employee_sick_leaves.Add(entities);
                Context.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Data inserted successfully");
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }



        [Route("api/admins")]
        public HttpResponseMessage GetAdmins()
        {
            try
            {
                var entities = Context.admins.ToList();
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/admins/{id}")]
        public HttpResponseMessage GetAdminById(int id)
        {
            try
            {
                var entities = Context.admins.FirstOrDefault(e => e.admin_id == id);
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/admins")]
        public HttpResponseMessage PostAdmin([FromBody] admin entities)
        {
            try
            {
                Context.admins.Add(entities);
                Context.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Data inserted successfully");
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/admins/{id}")]
        public HttpResponseMessage PutAdmin(int id, [FromBody] admin entities)
        {
            try
            {
                var entity = Context.admins.FirstOrDefault(e => e.admin_id == id);
                if (entity != null)
                {
                    entity.first_name = entities.first_name;
                    entity.last_name = entities.last_name;
                    entity.email = entities.email;
                    entity.password = entities.password;
                    entity.contact = entities.contact;
                    entity.address = entities.address;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Data updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/admins/{id}")]
        public HttpResponseMessage DeleteAdmin(int id)
        {
            try
            {
                var entity = Context.admins.FirstOrDefault(e => e.admin_id == id);
                if (entity != null)
                {
                    Context.admins.Remove(entity);
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Client has been deleted successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Invalid client ID");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }



        [Route("api/employees")]
        public HttpResponseMessage GetEmployees()
        {
            try
            {
                var entities = Context.employees.ToList();
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/employees/{id}")]
        public HttpResponseMessage GetEmployeeById(int id)
        {
            try
            {
                var entities = Context.employees.FirstOrDefault(e => e.employee_id == id);
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/employee_documents/{emp_id}/{job_id}")]
        public HttpResponseMessage GetEmployeeDocuments(int emp_id, int job_id)
        {
            try
            {
                //var enti = Context.jobs_log.FirstOrDefault(e => e.employee_id == entities.employee_id);
                var entities = from jl in Context.jobs_log
                               join e in Context.employees on jl.employee_id equals e.employee_id
                               where jl.employee_id == emp_id && jl.job_id == job_id
                               select new
                               {
                                   first_name = e.first_name,
                                   NIF = e.NIF,
                                   NISS = e.NISS,
                                   passport = e.passport,
                                   visa = e.visa,
                                   residence_card = e.residence_card,
                                   SEF = e.SEF,
                                   boarding_pass = e.boarding_pass,
                                   CUTT = jl.cutt,
                               };
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/employees")]
        public HttpResponseMessage PostEmployee([FromBody] employee entities)
        {
            try
            {
                Context.employees.Add(entities);
                Context.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Data inserted successfully");
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [HttpPost]
        [Route("api/file_upload")]
        public HttpResponseMessage PostFileUpload()
        {
            if (HttpContext.Current.Request.Files.AllKeys.Any())
            {
                // Get the uploaded image from the Files collection  
                var httpPostedFile = HttpContext.Current.Request.Files["UploadedImage"];
                if (httpPostedFile != null)
                {
                    string n = string.Format("{0:yyyy-MM-dd_hh-mm-ss-tt}", DateTime.Now);

                    FileUpload imgupload = new FileUpload();
                    int length = httpPostedFile.ContentLength;
                    imgupload.imagedata = new byte[length]; //get imagedata  
                    httpPostedFile.InputStream.Read(imgupload.imagedata, 0, length);
                    //StringBuilder sb = new StringBuilder();
                    //foreach (char c in Path.GetFileName(httpPostedFile.FileName))
                    //{
                    //    if ((c >= '0' && c <= '9') || (c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || c == '.' || c == '_')
                    //    {
                    //        sb.Append(c);
                    //    }
                    //}

                    Random random = new Random();
                    const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                    //var sb = new string(Enumerable.Repeat(chars, length)
                    //  .Select(s => s[random.Next(s.Length)]).ToArray());

                    var sb = new string(Enumerable.Repeat(chars, 20)
                      .Select(s => s[random.Next(s.Length)]).ToArray());

                    imgupload.imagename = sb.ToString();
                    //db.FileUpload.Add(imgupload);
                    //db.SaveChanges();
                    string extension = Path.GetExtension(httpPostedFile.FileName);
                    //string filename = httpPostedFile.FileName;
                    string filename = sb.ToString();
                    string[] tokens = filename.Split('.');
                    string fileName = tokens[0] + "_" + n + extension;

                    //var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/Uploads/employee_documents"), fileName);
                    var fileSavePath = Path.Combine(@"H:\GIT\EmployeeManagement\EmployeeManagement\Uploads\employee_documents", fileName);
                    httpPostedFile.SaveAs(fileSavePath);

                    return Request.CreateResponse(HttpStatusCode.OK, "/Uploads/employee_documents/" + fileName);
                }
            }
            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "");

        }

        [Route("api/employees/{id}")]
        public HttpResponseMessage PutEmployee(int id, [FromBody] employee entities)
        {
            try
            {
                var entity = Context.employees.FirstOrDefault(e => e.employee_id == id);
                if (entity != null)
                {
                    entity.first_name = entities.first_name;
                    entity.last_name = entities.last_name;
                    entity.email = entities.email;
                    entity.password = entities.password;
                    entity.nif_number = entities.nif_number;
                    entity.dob = entities.dob;
                    entity.sex = entities.sex;
                    entity.driving_license = entities.driving_license;
                    entity.contact = entities.contact;
                    entity.nationality = entities.nationality;
                    entity.location = entities.location;
                    entity.address = entities.address;
                    entity.NIF = entities.NIF;
                    entity.NISS = entities.NISS;
                    entity.passport = entities.passport;
                    entity.visa = entities.visa;
                    entity.residence_card = entities.residence_card;
                    entity.SEF = entities.SEF;
                    entity.boarding_pass = entities.boarding_pass;
                    //entity.working_shift = entities.working_shift;

                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Data updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/change_employee_status/{id}")]
        public HttpResponseMessage PutChangeEmployeeStatus(int id, [FromBody] employee entities)
        {
            try
            {
                var entity = Context.employees.FirstOrDefault(e => e.employee_id == id);
                if (entity != null)
                {
                    entity.status = entities.status;
                    entity.comments = entities.comments;

                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Data updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/employees/{id}")]
        public HttpResponseMessage DeleteEmployee(int id)
        {
            try
            {
                var entity = Context.employees.FirstOrDefault(e => e.employee_id == id);
                if (entity != null)
                {
                    Context.employees.Remove(entity);
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Client has been deleted successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Invalid client ID");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }



        [Route("api/clients")]
        public HttpResponseMessage GetClients()
        {
            try
            {
                var entities = Context.clients.ToList();

                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/clients_names")]
        public HttpResponseMessage GetClientsNames()
        {
            try
            {
                var entities = from c in Context.clients
                               select new
                               {
                                   id = c.client_id,
                                   name = c.first_name + " " + c.last_name
                               };
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/clients/{id}")]
        public HttpResponseMessage GetClientById(int id)
        {
            try
            {
                var entities = Context.clients.FirstOrDefault(e => e.client_id == id);
                if (entities != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, entities);
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/clients")]
        public HttpResponseMessage PostClient([FromBody] client entities)
        {
            try
            {
                Context.clients.Add(entities);
                Context.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Data inserted successfully");
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/clients/{id}")]
        public HttpResponseMessage PutClient(int id, [FromBody] client entities)
        {
            try
            {
                var entity = Context.clients.FirstOrDefault(e => e.client_id == id);
                if (entity != null)
                {
                    entity.first_name = entities.first_name;
                    entity.last_name = entities.last_name;
                    entity.email = entities.email;
                    entity.password = entities.password;
                    entity.contact = entities.contact;
                    entity.address = entities.address;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Data updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/clients/{id}")]
        public HttpResponseMessage DeleteClient(int id)
        {
            try
            {
                var entity = Context.clients.FirstOrDefault(e => e.client_id == id);
                if (entity != null)
                {
                    Context.clients.Remove(entity);
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Client has been deleted successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Invalid client ID");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/get_password")]
        public HttpResponseMessage GetPassword(int id, string type)
        {
            try
            {
                //var entity = "";
                if (type == "admin")
                {
                    //entity = Convert.ToString(Context.admins.FirstOrDefault(e => e.admin_id == id));
                    return Request.CreateResponse(HttpStatusCode.OK, Context.admins.FirstOrDefault(e => e.admin_id == id));
                }
                else if (type == "client")
                {
                    //entity = Convert.ToString(Context.clients.FirstOrDefault(e => e.client_id == id));
                    return Request.CreateResponse(HttpStatusCode.OK, Context.clients.FirstOrDefault(e => e.client_id == id));
                }
                else if (type == "employee")
                {
                    //entity = Convert.ToString(Context.employees.FirstOrDefault(e => e.employee_id == id));
                    return Request.CreateResponse(HttpStatusCode.OK, Context.employees.FirstOrDefault(e => e.employee_id == id));
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }

            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/change_admin_password/{id}")]
        public HttpResponseMessage PutChangeAdminPassword(int id, [FromBody] admin entities)
        {
            try
            {
                var entity = Context.admins.FirstOrDefault(e => e.admin_id == id);
                if (entity != null)
                {
                    entity.password = entities.password;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Password updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/change_client_password/{id}")]
        public HttpResponseMessage PutChangeClientPassword(int id, [FromBody] client entities)
        {
            try
            {
                var entity = Context.clients.FirstOrDefault(e => e.client_id == id);
                if (entity != null)
                {
                    entity.password = entities.password;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Password updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/change_employee_password/{id}")]
        public HttpResponseMessage PutChangeEmployeePassword(int id, [FromBody] employee entities)
        {
            try
            {
                var entity = Context.employees.FirstOrDefault(e => e.employee_id == id);
                if (entity != null)
                {
                    entity.password = entities.password;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Password updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/check_admin_email")]
        public HttpResponseMessage GetCheckAdminEmail(string email)
        {
            try
            {
                var entity = Context.admins.FirstOrDefault(e => e.email == email);
                if (entity != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "Email Found");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/check_employee_email")]
        public HttpResponseMessage GetCheckEmployeeEmail(string email)
        {
            try
            {
                var entity = Context.employees.FirstOrDefault(e => e.email == email);
                if (entity != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "Email Found");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/check_client_email")]
        public HttpResponseMessage GetCheckClientEmail(string email)
        {
            try
            {
                var entity = Context.clients.FirstOrDefault(e => e.email == email);
                if (entity != null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "Email Found");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/send_email")]
        public HttpResponseMessage GetSendMail(string EmailBody, string EmailAddress, string Subject)
        {
            string htmlbody = EmailBody;
            SmtpClient client = new SmtpClient();
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("workpermit79@gmail.com", "workpermit12317");//email and password , which email is sending email
            MailMessage mm = new MailMessage(EmailAddress, EmailAddress, Subject, htmlbody);
            mm.From = new MailAddress("info@test.com", Subject);
            mm.IsBodyHtml = true;
            mm.Priority = MailPriority.Normal;
            //mm.ReplyToList.Add("genial365erp123@gmail.com");

            mm.BodyEncoding = Encoding.Default;
            mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
            try
            {
                client.Send(mm);
                return Request.CreateResponse(HttpStatusCode.OK, "Email Found");
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/change_admin_password")]
        public HttpResponseMessage PutChangeAdminPassword([FromBody] admin entities)
        {
            try
            {
                var entity = Context.admins.FirstOrDefault(e => e.email == entities.email);
                if (entity != null)
                {
                    entity.password = entities.password;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Password updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/change_client_password")]
        public HttpResponseMessage PutChangeClientPassword([FromBody] client entities)
        {
            try
            {
                var entity = Context.clients.FirstOrDefault(e => e.email == entities.email);
                if (entity != null)
                {
                    entity.password = entities.password;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Password updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/change_employee_password")]
        public HttpResponseMessage PutChangeEmployeePassword([FromBody] employee entities)
        {
            try
            {
                var entity = Context.employees.FirstOrDefault(e => e.email == entities.email);
                if (entity != null)
                {
                    entity.password = entities.password;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Password updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }


        [Route("api/agriculture_job_offers_new")]
        public HttpResponseMessage GetAgricultureJobOffersNew()
        {
            try
            {
                var entities = from e in Context.job_offers
                               where e.job_type == "agriculture" && e.job_status == "open"
                               select new
                               {
                                   job_offer_id = e.job_offer_id,
                                   job_title = e.job_title,
                                   job_last_date = e.job_last_date,
                                   job_shift = e.job_shift,
                                   job_details = e.job_details,
                                   job_type = e.job_type,
                                   job_location = e.job_location
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/agriculture_job_offers_closed")]
        public HttpResponseMessage GetAgricultureJobOffersClosed()
        {
            try
            {
                var entities = from e in Context.job_offers
                               where e.job_type == "agriculture" && e.job_status == "closed"
                               select new
                               {
                                   job_offer_id = e.job_offer_id,
                                   job_title = e.job_title,
                                   job_last_date = e.job_last_date,
                                   job_shift = e.job_shift,
                                   job_details = e.job_details,
                                   job_type = e.job_type,
                                   job_location = e.job_location
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/industry_job_offers_new")]
        public HttpResponseMessage GetIndustryJobOffersNew()
        {
            try
            {
                var entities = from e in Context.job_offers
                               where e.job_type == "industry" && e.job_status == "open"
                               select new
                               {
                                   job_offer_id = e.job_offer_id,
                                   job_title = e.job_title,
                                   job_last_date = e.job_last_date,
                                   job_shift = e.job_shift,
                                   job_details = e.job_details,
                                   job_type = e.job_type,
                                   job_location = e.job_location
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/industry_job_offers_closed")]
        public HttpResponseMessage GetIndustryJobOffersClosed()
        {
            try
            {
                var entities = from e in Context.job_offers
                               where e.job_type == "industry" && e.job_status == "closed"
                               select new
                               {
                                   job_offer_id = e.job_offer_id,
                                   job_title = e.job_title,
                                   job_last_date = e.job_last_date,
                                   job_shift = e.job_shift,
                                   job_details = e.job_details,
                                   job_type = e.job_type,
                                   job_location = e.job_location
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/retail_job_offers_new")]
        public HttpResponseMessage GetRetailJobOffersNew()
        {
            try
            {
                var entities = from e in Context.job_offers
                               where e.job_type == "retail" && e.job_status == "new"
                               select new
                               {
                                   job_offer_id = e.job_offer_id,
                                   job_title = e.job_title,
                                   job_last_date = e.job_last_date,
                                   job_shift = e.job_shift,
                                   job_details = e.job_details,
                                   job_type = e.job_type,
                                   job_location = e.job_location
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/retail_job_offers_closed")]
        public HttpResponseMessage GetRetailJobOffersClosed()
        {
            try
            {
                var entities = from e in Context.job_offers
                               where e.job_type == "retail" && e.job_status == "closed"
                               select new
                               {
                                   job_offer_id = e.job_offer_id,
                                   job_title = e.job_title,
                                   job_last_date = e.job_last_date,
                                   job_shift = e.job_shift,
                                   job_details = e.job_details,
                                   job_type = e.job_type,
                                   job_location = e.job_location
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/job_offers")]
        public HttpResponseMessage PostJobOffers([FromBody] job_offers entities)
        {
            try
            {
                Context.job_offers.Add(entities);
                Context.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Data inserted successfully");
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/close_job_offer")]
        public HttpResponseMessage PutCloseJobOffer([FromBody] job_offers entities)
        {
            try
            {
                var entity = Context.job_offers.FirstOrDefault(e => e.job_offer_id == entities.job_offer_id);
                if (entity != null)
                {
                    entity.job_status = "closed";
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Job Offer has been closed");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/delete_job_offer")]
        public HttpResponseMessage DeleteJobOffer([FromBody] job_offers entities)
        {
            try
            {
                var entity = Context.job_offers.FirstOrDefault(e => e.job_offer_id == entities.job_offer_id);
                if (entity != null)
                {
                    Context.job_offers.Remove(entity);
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Job offer has been deleted successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Invalid Job Offer ID");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/job_applicants")]
        public HttpResponseMessage PostJobApplicants([FromBody] job_applicants entities)
        {
            try
            {
                Context.job_applicants.Add(entities);
                Context.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Data inserted successfully");
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }


        [Route("api/agriculture_job_applications_new")]
        public HttpResponseMessage GetAgricultureJobApplicationsNew()
        {
            try
            {
                var entities = from e in Context.job_applicants
                               where e.job_offer_type == "agriculture" && e.status == "pending"
                               select new
                               {
                                   applicant_id = e.applicant_id,
                                   first_name = e.first_name,
                                   last_name = e.last_name,
                                   dob = e.dob,
                                   sex = e.sex,
                                   email = e.email,
                                   contact = e.contact,
                                   address = e.address,
                                   nif_number = e.nif_number,
                                   nationality = e.nationality,
                                   passport_number = e.passport_number,
                                   passport_validity_year = e.passport_validity_year,
                                   medical_examination = e.medical_examination,
                                   exam_date = e.exam_date,
                                   apply_date = e.apply_date,
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/agriculture_job_applications_approved")]
        public HttpResponseMessage GetAgricultureJobApplicationsApproved()
        {
            try
            {
                var entities = from e in Context.job_applicants
                               where e.job_offer_type == "agriculture" && e.status == "approved"
                               select new
                               {
                                   applicant_id = e.applicant_id,
                                   first_name = e.first_name,
                                   last_name = e.last_name,
                                   dob = e.dob,
                                   sex = e.sex,
                                   email = e.email,
                                   contact = e.contact,
                                   address = e.address,
                                   nif_number = e.nif_number,
                                   nationality = e.nationality,
                                   passport_number = e.passport_number,
                                   passport_validity_year = e.passport_validity_year,
                                   medical_examination = e.medical_examination,
                                   exam_date = e.exam_date,
                                   apply_date = e.apply_date,
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/agriculture_job_applications_rejected")]
        public HttpResponseMessage GetAgricultureJobApplicationsRejected()
        {
            try
            {
                var entities = from e in Context.job_applicants
                               where e.job_offer_type == "agriculture" && e.status == "rejected"
                               select new
                               {
                                   applicant_id = e.applicant_id,
                                   first_name = e.first_name,
                                   last_name = e.last_name,
                                   dob = e.dob,
                                   sex = e.sex,
                                   email = e.email,
                                   contact = e.contact,
                                   address = e.address,
                                   nif_number = e.nif_number,
                                   nationality = e.nationality,
                                   passport_number = e.passport_number,
                                   passport_validity_year = e.passport_validity_year,
                                   medical_examination = e.medical_examination,
                                   exam_date = e.exam_date,
                                   apply_date = e.apply_date,
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }


        [Route("api/industry_job_applications_new")]
        public HttpResponseMessage GetIndustryJobApplicationsNew()
        {
            try
            {
                var entities = from e in Context.job_applicants
                               where e.job_offer_type == "industry" && e.status == "pending"
                               select new
                               {
                                   applicant_id = e.applicant_id,
                                   first_name = e.first_name,
                                   last_name = e.last_name,
                                   dob = e.dob,
                                   sex = e.sex,
                                   email = e.email,
                                   contact = e.contact,
                                   address = e.address,
                                   nif_number = e.nif_number,
                                   nationality = e.nationality,
                                   passport_number = e.passport_number,
                                   passport_validity_year = e.passport_validity_year,
                                   medical_examination = e.medical_examination,
                                   exam_date = e.exam_date,
                                   apply_date = e.apply_date,
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/industry_job_applications_approved")]
        public HttpResponseMessage GetIndustryJobApplicationsApproved()
        {
            try
            {
                var entities = from e in Context.job_applicants
                               where e.job_offer_type == "industry" && e.status == "approved"
                               select new
                               {
                                   applicant_id = e.applicant_id,
                                   first_name = e.first_name,
                                   last_name = e.last_name,
                                   dob = e.dob,
                                   sex = e.sex,
                                   email = e.email,
                                   contact = e.contact,
                                   address = e.address,
                                   nif_number = e.nif_number,
                                   nationality = e.nationality,
                                   passport_number = e.passport_number,
                                   passport_validity_year = e.passport_validity_year,
                                   medical_examination = e.medical_examination,
                                   exam_date = e.exam_date,
                                   apply_date = e.apply_date,
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/industry_job_applications_rejected")]
        public HttpResponseMessage GetIndustryJobApplicationsRejected()
        {
            try
            {
                var entities = from e in Context.job_applicants
                               where e.job_offer_type == "industry" && e.status == "rejected"
                               select new
                               {
                                   applicant_id = e.applicant_id,
                                   first_name = e.first_name,
                                   last_name = e.last_name,
                                   dob = e.dob,
                                   sex = e.sex,
                                   email = e.email,
                                   contact = e.contact,
                                   address = e.address,
                                   nif_number = e.nif_number,
                                   nationality = e.nationality,
                                   passport_number = e.passport_number,
                                   passport_validity_year = e.passport_validity_year,
                                   medical_examination = e.medical_examination,
                                   exam_date = e.exam_date,
                                   apply_date = e.apply_date,
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }



        [Route("api/retail_job_applications_new")]
        public HttpResponseMessage GetRetailJobApplicationsNew()
        {
            try
            {
                var entities = from e in Context.job_applicants
                               where e.job_offer_type == "retail" && e.status == "pending"
                               select new
                               {
                                   applicant_id = e.applicant_id,
                                   first_name = e.first_name,
                                   last_name = e.last_name,
                                   dob = e.dob,
                                   sex = e.sex,
                                   email = e.email,
                                   contact = e.contact,
                                   address = e.address,
                                   nif_number = e.nif_number,
                                   nationality = e.nationality,
                                   passport_number = e.passport_number,
                                   passport_validity_year = e.passport_validity_year,
                                   medical_examination = e.medical_examination,
                                   exam_date = e.exam_date,
                                   apply_date = e.apply_date,
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/retail_job_applications_approved")]
        public HttpResponseMessage GetRetailJobApplicationsApproved()
        {
            try
            {
                var entities = from e in Context.job_applicants
                               where e.job_offer_type == "retail" && e.status == "approved"
                               select new
                               {
                                   applicant_id = e.applicant_id,
                                   first_name = e.first_name,
                                   last_name = e.last_name,
                                   dob = e.dob,
                                   sex = e.sex,
                                   email = e.email,
                                   contact = e.contact,
                                   address = e.address,
                                   nif_number = e.nif_number,
                                   nationality = e.nationality,
                                   passport_number = e.passport_number,
                                   passport_validity_year = e.passport_validity_year,
                                   medical_examination = e.medical_examination,
                                   exam_date = e.exam_date,
                                   apply_date = e.apply_date,
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/retail_job_applications_rejected")]
        public HttpResponseMessage GetRetailJobApplicationsRejected()
        {
            try
            {
                var entities = from e in Context.job_applicants
                               where e.job_offer_type == "retail" && e.status == "rejected"
                               select new
                               {
                                   applicant_id = e.applicant_id,
                                   first_name = e.first_name,
                                   last_name = e.last_name,
                                   dob = e.dob,
                                   sex = e.sex,
                                   email = e.email,
                                   contact = e.contact,
                                   address = e.address,
                                   nif_number = e.nif_number,
                                   nationality = e.nationality,
                                   passport_number = e.passport_number,
                                   passport_validity_year = e.passport_validity_year,
                                   medical_examination = e.medical_examination,
                                   exam_date = e.exam_date,
                                   apply_date = e.apply_date,
                               };
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/job_applicants/{id}")]
        public HttpResponseMessage GetApplicants(int id)
        {
            try
            {
                var entities = Context.job_applicants.FirstOrDefault(e => e.applicant_id == id);
                return Request.CreateResponse(HttpStatusCode.OK, entities);
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }

        [Route("api/job_applicants/{id}")]

        public HttpResponseMessage PutApplicants(int id, [FromBody] job_applicants entities)
        {
            try
            {
                var entity = Context.job_applicants.FirstOrDefault(e => e.applicant_id == id);
                if (entity != null)
                {
                    entity.status = entities.status;
                    Context.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, "Data updated successfully");
                }
                else
                {
                    return Request.CreateResponse(HttpStatusCode.NotFound, "Not Found");
                }
            }
            catch (Exception)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, "Something went wrong");
            }
        }
    }
}