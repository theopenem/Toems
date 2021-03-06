﻿using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Toems_Common.Enum;

namespace Toems_Common.Entity
{
    [Table("policy_modules")]
    public class EntityPolicyModules
    {
        public EntityPolicyModules()
        {
            ConditionId = -1;
            ConditionFailedAction = 0;
            ConditionNextModule = 0;
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("policy_module_id", Order = 1)]
        public int Id { get; set; }

        [Column("policy_id", Order = 2)]
        public int PolicyId { get; set; }

        [Column("module_id", Order = 3)]
        public int ModuleId { get; set; }

        [Column("module_guid", Order = 4)]
        public string Guid { get; set; }

        [Column("module_type", Order = 5)]
        public EnumModule.ModuleType ModuleType { get; set; }

        [Column("module_order", Order = 6)]
        public int Order { get; set; }

        [Column("condition_module_id")]
        public int ConditionId { get; set; }

        [Column("condition_failed_action")]
        public EnumCondition.FailedAction ConditionFailedAction { get; set; }

        [Column("condition_next_module")]
        public int ConditionNextModule { get; set; }

        [NotMapped]
        public string Name { get; set; }
    }

   
}
