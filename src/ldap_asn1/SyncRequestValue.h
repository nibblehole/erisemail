/*
 * Generated by asn1c-0.9.24 (http://lionet.info/asn1c)
 * From ASN.1 module "Lightweight-Directory-Access-Protocol-V3"
 * 	found in "simple_ldap_asn1.asn"
 */

#ifndef	_SyncRequestValue_H_
#define	_SyncRequestValue_H_


#include <asn_application.h>

/* Including external dependencies */
#include <ENUMERATED.h>
#include <OCTET_STRING.h>
#include <BOOLEAN.h>
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */
typedef enum SyncRequestValue__mode {
	SyncRequestValue__mode_refreshOnly	= 1,
	SyncRequestValue__mode_refreshAndPersist	= 3
} e_SyncRequestValue__mode;

/* SyncRequestValue */
typedef struct SyncRequestValue {
	ENUMERATED_t	 mode;
	OCTET_STRING_t	*cookie	/* OPTIONAL */;
	BOOLEAN_t	*reloadHint	/* DEFAULT FALSE */;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} SyncRequestValue_t;

/* Implementation */
/* extern asn_TYPE_descriptor_t asn_DEF_mode_2;	// (Use -fall-defs-global to expose) */
extern asn_TYPE_descriptor_t asn_DEF_SyncRequestValue;

#ifdef __cplusplus
}
#endif

#endif	/* _SyncRequestValue_H_ */
#include <asn_internal.h>