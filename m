From: Eric Leblond <eric@regit.org>
Subject: Re: [PATCH] ulogd: make NFCT packet counter/length 64 bit
Date: Thu, 10 Oct 2013 02:36:22 +0200
Message-ID: <1381365382.11941.6.camel@ifere.edenwall.com>
References: <20131009100001.GA6222@gir>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20131009100001.GA6222@gir>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Ulrich Weber <uw@xyne.com>
Cc: netfilter@vger.kernel.org

Hello,

Le mercredi 09 octobre 2013 =C3=A0 12:00 +0200, Ulrich Weber a =C3=A9cr=
it :
> Kernel and libnetfilter_conntrack counters are 64bit,
> so use 64bit too in ulogd instead of 32bit.
>=20
> Worked fine on little endian systems but big endian systems
> had zero counter...
>=20
> Didn't test ipfix output, but RFC allows template with
> either 32 or 64 counters, so should be safe.
>=20
> Signed-off-by: Ulrich Weber <uw@xyne.com>

Applied. I will pushed it to public repository when I come back from
holiday this weekend.

Thanks a lot.
--
Eric

>  input/flow/ulogd_inpflow_NFCT.c | 24 ++++++++++++------------
>  output/ulogd_output_NACCT.c     | 16 ++++++++--------
>  util/printflow.c                | 16 ++++++++--------
>  3 files changed, 28 insertions(+), 28 deletions(-)
>=20
> diff --git a/input/flow/ulogd_inpflow_NFCT.c b/input/flow/ulogd_inpfl=
ow_NFCT.c
> index afb6c18..ab2bc10 100644
> --- a/input/flow/ulogd_inpflow_NFCT.c
> +++ b/input/flow/ulogd_inpflow_NFCT.c
> @@ -240,7 +240,7 @@ static struct ulogd_key nfct_okeys[] =3D {
>  		},
>  	},
>  	{
> -		.type	=3D ULOGD_RET_UINT32,
> +		.type	=3D ULOGD_RET_UINT64,
>  		.flags	=3D ULOGD_RETF_NONE,
>  		.name	=3D "orig.raw.pktlen",
>  		.ipfix	=3D {
> @@ -250,7 +250,7 @@ static struct ulogd_key nfct_okeys[] =3D {
>  		},
>  	},
>  	{
> -		.type	=3D ULOGD_RET_UINT32,
> +		.type	=3D ULOGD_RET_UINT64,
>  		.flags	=3D ULOGD_RETF_NONE,
>  		.name	=3D "orig.raw.pktcount",
>  		.ipfix	=3D {
> @@ -305,7 +305,7 @@ static struct ulogd_key nfct_okeys[] =3D {
>  		},
>  	},
>  	{
> -		.type	=3D ULOGD_RET_UINT32,
> +		.type	=3D ULOGD_RET_UINT64,
>  		.flags	=3D ULOGD_RETF_NONE,
>  		.name	=3D "reply.raw.pktlen",
>  		.ipfix	=3D {
> @@ -315,7 +315,7 @@ static struct ulogd_key nfct_okeys[] =3D {
>  		},
>  	},
>  	{
> -		.type	=3D ULOGD_RET_UINT32,
> +		.type	=3D ULOGD_RET_UINT64,
>  		.flags	=3D ULOGD_RETF_NONE,
>  		.name	=3D "reply.raw.pktcount",
>  		.ipfix	=3D {
> @@ -561,14 +561,14 @@ static int propagate_ct(struct ulogd_pluginstan=
ce *main_upi,
>  			     htons(nfct_get_attr_u16(ct, ATTR_REPL_PORT_DST)));
>  	}
> =20
> -	okey_set_u32(&ret[NFCT_ORIG_RAW_PKTLEN],
> -		     nfct_get_attr_u32(ct, ATTR_ORIG_COUNTER_BYTES));
> -	okey_set_u32(&ret[NFCT_ORIG_RAW_PKTCOUNT],
> -		     nfct_get_attr_u32(ct, ATTR_ORIG_COUNTER_PACKETS));
> -	okey_set_u32(&ret[NFCT_REPLY_RAW_PKTLEN],
> -		     nfct_get_attr_u32(ct, ATTR_REPL_COUNTER_BYTES));
> -	okey_set_u32(&ret[NFCT_REPLY_RAW_PKTCOUNT],
> -		     nfct_get_attr_u32(ct, ATTR_REPL_COUNTER_PACKETS));
> +	okey_set_u64(&ret[NFCT_ORIG_RAW_PKTLEN],
> +		     nfct_get_attr_u64(ct, ATTR_ORIG_COUNTER_BYTES));
> +	okey_set_u64(&ret[NFCT_ORIG_RAW_PKTCOUNT],
> +		     nfct_get_attr_u64(ct, ATTR_ORIG_COUNTER_PACKETS));
> +	okey_set_u64(&ret[NFCT_REPLY_RAW_PKTLEN],
> +		     nfct_get_attr_u64(ct, ATTR_REPL_COUNTER_BYTES));
> +	okey_set_u64(&ret[NFCT_REPLY_RAW_PKTCOUNT],
> +		     nfct_get_attr_u64(ct, ATTR_REPL_COUNTER_PACKETS));
> =20
>  	okey_set_u32(&ret[NFCT_CT_MARK], nfct_get_attr_u32(ct, ATTR_MARK));
>  	okey_set_u32(&ret[NFCT_CT_ID], nfct_get_attr_u32(ct, ATTR_ID));
> diff --git a/output/ulogd_output_NACCT.c b/output/ulogd_output_NACCT.=
c
> index 04c5ab1..e989f92 100644
> --- a/output/ulogd_output_NACCT.c
> +++ b/output/ulogd_output_NACCT.c
> @@ -80,12 +80,12 @@ static struct ulogd_key nacct_inp[] =3D {
>  	},
>  	/* Assume we're interested more in download than upload */
>  	[KEY_RAW_PKTLEN] =3D {
> -		.type	=3D ULOGD_RET_UINT32,
> +		.type	=3D ULOGD_RET_UINT64,
>  		.flags	=3D ULOGD_RETF_NONE,
>  		.name	=3D "reply.raw.pktlen",
>  	},
>  	[KEY_RAW_PKTCNT] =3D {
> -		.type	=3D ULOGD_RET_UINT32,
> +		.type	=3D ULOGD_RET_UINT64,
>  		.flags	=3D ULOGD_RETF_NONE,
>  		.name	=3D "reply.raw.pktcount",
>  	},
> @@ -127,26 +127,26 @@ nacct_interp(struct ulogd_pluginstance *pi)
>  	   'timestamp' value use 'flow.end.sec' */
>  	if (ikey_get_u8(&inp[KEY_IP_PROTO]) =3D=3D IPPROTO_ICMP) {
>  		snprintf(buf, sizeof(buf),
> -				 "%u\t%u\t%s\t%u\t%s\t%u\t%u\t%u",
> +				 "%u\t%u\t%s\t%u\t%s\t%u\t%llu\t%llu",
>  				 ikey_get_u32(&inp[KEY_FLOW_END]),
>  				 ikey_get_u8(&inp[KEY_IP_PROTO]),
>  				 (char *) ikey_get_ptr(&inp[KEY_IP_SADDR]),
>  				 ikey_get_u8(&inp[KEY_ICMP_TYPE]),
>  				 (char *) ikey_get_ptr(&inp[KEY_IP_DADDR]),
>  				 ikey_get_u8(&inp[KEY_ICMP_CODE]),
> -				 ikey_get_u32(&inp[KEY_RAW_PKTCNT]),
> -				 ikey_get_u32(&inp[KEY_RAW_PKTLEN]));
> +				 ikey_get_u64(&inp[KEY_RAW_PKTCNT]),
> +				 ikey_get_u64(&inp[KEY_RAW_PKTLEN]));
>  	} else {
>  		snprintf(buf, sizeof(buf),
> -				 "%u\t%u\t%s\t%u\t%s\t%u\t%u\t%u",
> +				 "%u\t%u\t%s\t%u\t%s\t%u\t%llu\t%llu",
>  				 ikey_get_u32(&inp[KEY_FLOW_END]),
>  				 ikey_get_u8(&inp[KEY_IP_PROTO]),
>  				 (char *) ikey_get_ptr(&inp[KEY_IP_SADDR]),
>  				 ikey_get_u16(&inp[KEY_L4_SPORT]),
>  				 (char *) ikey_get_ptr(&inp[KEY_IP_DADDR]),
>  				 ikey_get_u16(&inp[KEY_L4_DPORT]),
> -				 ikey_get_u32(&inp[KEY_RAW_PKTCNT]),
> -				 ikey_get_u32(&inp[KEY_RAW_PKTLEN]));
> +				 ikey_get_u64(&inp[KEY_RAW_PKTCNT]),
> +				 ikey_get_u64(&inp[KEY_RAW_PKTLEN]));
>  	}
> =20
>  	fprintf(priv->of, "%s\n", buf);
> diff --git a/util/printflow.c b/util/printflow.c
> index 30e622c..7702063 100644
> --- a/util/printflow.c
> +++ b/util/printflow.c
> @@ -73,12 +73,12 @@ struct ulogd_key printflow_keys[FLOW_IDS] =3D {
>  		.name =3D "orig.l4.dport",
>  	},
>  	{
> -		.type =3D ULOGD_RET_UINT32,
> +		.type =3D ULOGD_RET_UINT64,
>  		.flags =3D ULOGD_RETF_NONE,
>  		.name =3D "orig.raw.pktlen",
>  	},
>  	{
> -		.type =3D ULOGD_RET_UINT32,
> +		.type =3D ULOGD_RET_UINT64,
>  		.flags =3D ULOGD_RETF_NONE,
>  		.name =3D "orig.raw.pktcount",
>  	},
> @@ -108,12 +108,12 @@ struct ulogd_key printflow_keys[FLOW_IDS] =3D {
>  		.name =3D "reply.l4.dport",
>  	},
>  	{
> -		.type =3D ULOGD_RET_UINT32,
> +		.type =3D ULOGD_RET_UINT64,
>  		.flags =3D ULOGD_RETF_NONE,
>  		.name =3D "reply.raw.pktlen",
>  	},
>  	{
> -		.type =3D ULOGD_RET_UINT32,
> +		.type =3D ULOGD_RET_UINT64,
>  		.flags =3D ULOGD_RETF_NONE,
>  		.name =3D "reply.raw.pktcount",
>  	},
> @@ -205,8 +205,8 @@ int printflow_print(struct ulogd_key *res, char *=
buf)
>  	}
> =20
>  orig_out:
> -	pp_print(buf_cur, "PKTS", res, PRINTFLOW_ORIG_RAW_PKTCOUNT, u32);
> -	pp_print(buf_cur, "BYTES", res, PRINTFLOW_ORIG_RAW_PKTLEN, u32);
> +	pp_print(buf_cur, "PKTS", res, PRINTFLOW_ORIG_RAW_PKTCOUNT, u64);
> +	pp_print(buf_cur, "BYTES", res, PRINTFLOW_ORIG_RAW_PKTLEN, u64);
> =20
>  	buf_cur +=3D sprintf(buf_cur, ", REPLY: ");
> =20
> @@ -256,8 +256,8 @@ orig_out:
>  	}
> =20
>  reply_out:
> -	pp_print(buf_cur, "PKTS", res, PRINTFLOW_REPLY_RAW_PKTCOUNT, u32);
> -	pp_print(buf_cur, "BYTES", res, PRINTFLOW_REPLY_RAW_PKTLEN, u32);
> +	pp_print(buf_cur, "PKTS", res, PRINTFLOW_REPLY_RAW_PKTCOUNT, u64);
> +	pp_print(buf_cur, "BYTES", res, PRINTFLOW_REPLY_RAW_PKTLEN, u64);
> =20
>  	strcat(buf_cur, "\n");
>  	return 0;

--=20
Eric Leblond

