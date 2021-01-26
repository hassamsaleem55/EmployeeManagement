using DataAccess;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.UI.WebControls;

namespace EmployeeManagementApi.Controllers
{
    public class EmployeeManagementController : ApiController
    {
        employee_managementEntities Context = new employee_managementEntities();

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

        [Route("api/unassigned_employees/{shift}")]
        public HttpResponseMessage GetUnassignedEmployees(string shift)
        {
            try
            {
                var entities = from e in Context.employees
                               where e.status == "unassigned" && e.working_shift == shift
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
            catch  (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, ex);
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
                                   job_end_date = j.job_end_date,
                                   job_type = j.job_type,
                                   job_shift = j.job_shift,
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
                    imgupload.imagename = Path.GetFileName(httpPostedFile.FileName);
                    //db.FileUpload.Add(imgupload);
                    //db.SaveChanges();
                    string extension = Path.GetExtension(httpPostedFile.FileName);
                    if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".pdf" || extension.ToLower() == ".docx")
                    {
                        string filename = httpPostedFile.FileName;
                        string[] tokens = filename.Split('.');
                        string fileName = tokens[0] + "_" + n + extension;

                        //var fileSavePath = Path.Combine(HttpContext.Current.Server.MapPath("~/Uploads/employee_documents"), fileName);
                        var fileSavePath = Path.Combine(@"H:\GIT\EmployeeManagement\EmployeeManagement\Uploads\employee_documents", fileName);
                        // Save the uploaded file to "UploadedFiles" folder  
                        httpPostedFile.SaveAs(fileSavePath);

                        return Request.CreateResponse(HttpStatusCode.OK, "/Uploads/employee_documents/" + fileName);
                        //return Request.CreateResponse(fileSavePath);
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.OK, "Invalid file type");
                    }

                }
            }
            return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, "File Upload Error Please try again");

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
                    entity.contact = entities.contact;
                    entity.address = entities.address;
                    entity.NIF = entities.NIF;
                    entity.NISS = entities.NISS;
                    entity.passport = entities.passport;
                    entity.visa = entities.visa;
                    entity.residence_card = entities.residence_card;
                    entity.SEF = entities.SEF;
                    entity.boarding_pass = entities.boarding_pass;
                    entity.working_shift = entities.working_shift;

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
                //var entities = from c in Context.clients
                //               select new
                //               {
                //                   //id = c.client_id,
                //                   first_name = c.first_name,
                //                   last_name = c.last_name,
                //                   email = c.email,
                //                   password = c.password,
                //                   contact = c.contact,
                //               };
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
    }
}
