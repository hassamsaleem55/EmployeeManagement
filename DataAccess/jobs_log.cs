//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class jobs_log
    {
        public int id { get; set; }
        public Nullable<int> employee_id { get; set; }
        public Nullable<int> job_id { get; set; }
        public string operator_id { get; set; }
        public string payslip { get; set; }
        public string cutt { get; set; }
        public string status { get; set; }
    }
}
