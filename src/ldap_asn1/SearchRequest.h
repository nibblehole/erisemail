/*
 * Generated by asn1c-0.9.24 (http://lionet.info/asn1c)
 * From ASN.1 module "Lightweight-Directory-Access-Protocol-V3"
 * 	found in "simple_ldap_asn1.asn"
 */

#ifndef	_SearchRequest_H_
#define	_SearchRequest_H_


#include <asn_application.h>

/* Including external dependencies */
#include "LDAPDN.h"
#include <ENUMERATED.h>
#include <NativeInteger.h>
#include <BOOLEAN.h>
#include "Filter.h"
#include "AttributeDescriptionList.h"
#include <constr_SEQUENCE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */
typedef enum SearchRequest__scope {
	SearchRequest__scope_baseObject	= 0,
	SearchRequest__scope_singleLevel	= 1,
	SearchRequest__scope_wholeSubtree	= 2
} e_SearchRequest__scope;
typedef enum SearchRequest__derefAliases {
	SearchRequest__derefAliases_neverDerefAliases	= 0,
	SearchRequest__derefAliases_derefInSearching	= 1,
	SearchRequest__derefAliases_derefFindingBaseObj	= 2,
	SearchRequest__derefAliases_derefAlways	= 3
} e_SearchRequest__derefAliases;

/* SearchRequest */
typedef struct SearchRequest {
	LDAPDN_t	 baseObject;
	ENUMERATED_t	 scope;
	ENUMERATED_t	 derefAliases;
	long	 sizeLimit;
	long	 timeLimit;
	BOOLEAN_t	 typesOnly;
	Filter_t	 filter;
	AttributeDescriptionList_t	 attributes;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} SearchRequest_t;

/* Implementation */
/* extern asn_TYPE_descriptor_t asn_DEF_scope_3;	// (Use -fall-defs-global to expose) */
/* extern asn_TYPE_descriptor_t asn_DEF_derefAliases_7;	// (Use -fall-defs-global to expose) */
extern asn_TYPE_descriptor_t asn_DEF_SearchRequest;

#ifdef __cplusplus
}
#endif

#endif	/* _SearchRequest_H_ */
#include <asn_internal.h>
