From: "Changho Choi" <choi@cs.umn.edu>
Subject: skb_put(): add some data to the end of the data in sk_buff
Date: Thu, 27 Mar 2003 17:26:22 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002f01c2f4b8$47e00a20$ce0110ac@purity>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_002C_01C2F485.FC899D20"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_002C_01C2F485.FC899D20
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

Hi,
I want to add or subtract 40bytes to the end of the data in sk_buff.
So I made a module to do this.
Actually, I hooked up a packet LOCAL_OUT for the outgoing packet and =
added data structure, sip_tag to the sk_buff like below.
I added data using skb_put().
When I install the module and run the scp to transfer some data, it =
starts well.
But, after it sent about 320KB, the connection is stalled and freezed.
Is there any error in my code?

I appreciate any comments.

Thanks,
Changho Choi

ps: The reception part(sip_input) is also below.

-------------------------------------------------------------------------=
-----
sip_output(unsigned int hook, struct sk_buff **pskb,
               const struct net_device *indev, const
               struct net_device *outdev, int=20
               (*okfn)(struct sk_buff *))
{
 sip_tag *stag;
 struct iphdr *ip_hdr;
 int stag_len;

  ip_hdr =3D (*pskb)->nh.iph;  // ip header

 stag_len =3D sizeof(sip_tag);
=20
 // new packet size check
 if (stag_len > skb_tailroom(*pskb)) {
  struct sk_buff *newskb;
  printk("...sip_output: newskb...\n");
  newskb =3D skb_copy_expand(*pskb, skb_headroom(*pskb),
      stag_len,
      GFP_ATOMIC);

  if (!newskb) {
   printk("error: sip_output: resize the pskb...\n");
   return 0;
  } else {
   kfree_skb(*pskb);
   *pskb =3D newskb;
  }
 }

 // make a room for the security tag
 stag =3D (sip_tag *) skb_put(*pskb, stag_len);

 // assign some values to the stag
 if(init_stag(ip_hdr, stag) =3D=3D 0)
  return NF_DROP; // initialize the security tag

 // update ip header
 ip_hdr->tot_len =3D htons(ntohs(ip_hdr->tot_len) + stag_len);
 ip_send_check(ip_hdr); // calculate new checksum
=20
 (*pskb)->nfcache |=3D NFC_ALTERED;
=20
 return NF_ACCEPT;
}

// module install
static struct nf_hook_ops secureIP_output
=3D { { NULL, NULL }, sip_output,
    PF_INET, NF_IP_LOCAL_OUT,
       NF_IP_PRI_FILTER-1 };

int init_module(void)
{
 /* Register hooks */
 int ret;
=20
 ret =3D nf_register_hook(&secureIP_output);
 if (ret < 0)
  goto cleanup_output;
=20
 return ret;
=20
cleanup_output:
 nf_unregister_hook(&secureIP_output);
 return 0;
}

void cleanup_module(void)
{
 nf_unregister_hook(&secureIP_output);
}

---- reception part
I removed my data using skb_trim() and update the ip packet length.

static unsigned int
sip_input(unsigned int hook, struct sk_buff **pskb,
               const struct net_device *indev, const
               struct net_device *outdev, int=20
               (*okfn)(struct sk_buff *))
{
 sip_tag *stag;
 struct iphdr *ip_hdr;
 unsigned char mac[8];
 int i, stag_len;

 ip_hdr =3D (*pskb)->nh.iph;

 stag_len =3D sizeof(sip_tag);

 // get_sip_info()=20
=20
 stag =3D (sip_tag *) ((*pskb)->data + (*pskb)->len - stag_len);=20

 if(calculate_mac(ip_hdr, stag, mac) =3D=3D 0)
  return NF_DROP; // mac calculation failed

 // check mac value
 if(memcmp(stag->mac, mac, 8) !=3D 0){
  return NF_DROP;
 }
=20
 // remove stag
 skb_trim(*pskb, (*pskb)->len-stag_len);
=20
 ip_hdr->tot_len =3D ip_hdr->tot_len - stag_len;
 ip_send_check(ip_hdr); // calculate new checksum
=20
 (*pskb)->nfcache |=3D NFC_ALTERED;
=20
 return NF_ACCEPT;
}

// module installation part
static struct nf_hook_ops secureIP_input
=3D { { NULL, NULL }, sip_input,
    PF_INET, NF_IP_LOCAL_IN,
       NF_IP_PRI_FILTER-2 };

int init_module(void)
{
 /* Register hooks */
 int ret;
=20
 ret =3D nf_register_hook(&secureIP_input);
 if (ret < 0)
  goto cleanup_output;
=20
 return ret;
=20
cleanup_output:
 nf_unregister_hook(&secureIP_input);
 return 0;
}

void cleanup_module(void)
{
 nf_unregister_hook(&secureIP_input);
}
------=_NextPart_000_002C_01C2F485.FC899D20
Content-Type: text/html;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dks_c_5601-1987">
<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I want to add or subtract 40bytes to =
the end of the=20
data in sk_buff.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>So I made a module to do =
this.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Actually, I hooked up a packet =
LOCAL_OUT for the=20
outgoing packet and added data structure, sip_tag to the sk_buff like=20
below.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I added data using =
skb_put().</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>When I install the module and run the =
scp to=20
transfer some data, it starts&nbsp;well.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>But, after it sent about 320KB, the =
connection is=20
stalled and freezed.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Is there any error&nbsp;in my =
code?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I appreciate any comments.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Changho Choi</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ps: The reception part(sip_input) is =
also=20
below.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
--------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>sip_output(unsigned int hook, struct =
sk_buff=20
**pskb,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;=20
const struct net_device *indev,=20
const<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
struct net_device *outdev, int=20
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
(*okfn)(struct sk_buff *))<BR>{<BR>&nbsp;sip_tag *stag;<BR>&nbsp;struct =
iphdr=20
*ip_hdr;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;int stag_len;<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;ip_hdr =3D =
(*pskb)-&gt;nh.iph;&nbsp; //=20
ip header</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;stag_len =3D=20
sizeof(sip_tag);<BR>&nbsp;<BR>&nbsp;// new packet size check<BR>&nbsp;if =

(stag_len &gt; skb_tailroom(*pskb)) {<BR>&nbsp;&nbsp;struct sk_buff=20
*newskb;<BR>&nbsp;&nbsp;printk("...sip_output:=20
newskb...\n");<BR>&nbsp;&nbsp;newskb =3D skb_copy_expand(*pskb,=20
skb_headroom(*pskb),<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
stag_len,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_ATOMIC);</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;if (!newskb)=20
{<BR>&nbsp;&nbsp;&nbsp;printk("error: sip_output: resize the=20
pskb...\n");<BR>&nbsp;&nbsp;&nbsp;return 0;<BR>&nbsp;&nbsp;} else=20
{<BR>&nbsp;&nbsp;&nbsp;kfree_skb(*pskb);<BR>&nbsp;&nbsp;&nbsp;*pskb =3D=20
newskb;<BR>&nbsp;&nbsp;}<BR>&nbsp;}</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;// make a room for the security=20
tag<BR>&nbsp;stag =3D (sip_tag *) skb_put(*pskb, =
stag_len);<BR><BR>&nbsp;// assign=20
some values to the stag<BR>&nbsp;if(init_stag(ip_hdr, stag) =3D=3D=20
0)<BR>&nbsp;&nbsp;return NF_DROP; // initialize the security =
tag</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;// update ip=20
header<BR>&nbsp;ip_hdr-&gt;tot_len =3D htons(ntohs(ip_hdr-&gt;tot_len) + =

stag_len);<BR>&nbsp;ip_send_check(ip_hdr); // calculate new=20
checksum<BR>&nbsp;<BR>&nbsp;(*pskb)-&gt;nfcache |=3D=20
NFC_ALTERED;<BR>&nbsp;<BR>&nbsp;return NF_ACCEPT;<BR>}</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>// module install</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>static struct nf_hook_ops =
secureIP_output<BR>=3D { {=20
NULL, NULL }, sip_output,<BR>&nbsp;&nbsp;&nbsp; PF_INET,=20
NF_IP_LOCAL_OUT,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
NF_IP_PRI_FILTER-1=20
};</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>int init_module(void)<BR>{<BR>&nbsp;/* =
Register=20
hooks */<BR>&nbsp;int ret;<BR>&nbsp;<BR>&nbsp;ret =3D=20
nf_register_hook(&amp;secureIP_output);<BR>&nbsp;if (ret &lt;=20
0)<BR>&nbsp;&nbsp;goto cleanup_output;<BR>&nbsp;<BR>&nbsp;return=20
ret;<BR>&nbsp;<BR>cleanup_output:<BR>&nbsp;nf_unregister_hook(&amp;secure=
IP_output);<BR>&nbsp;return=20
0;<BR>}</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>void=20
cleanup_module(void)<BR>{<BR>&nbsp;nf_unregister_hook(&amp;secureIP_outpu=
t);<BR>}</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>---- reception part</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I removed my data using skb_trim() and =
update the=20
ip packet length.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>static unsigned =
int<BR>sip_input(unsigned int hook,=20
struct sk_buff=20
**pskb,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;=20
const struct net_device *indev,=20
const<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
struct net_device *outdev, int=20
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
(*okfn)(struct sk_buff *))<BR>{<BR>&nbsp;sip_tag *stag;<BR>&nbsp;struct =
iphdr=20
*ip_hdr;<BR>&nbsp;unsigned char mac[8];<BR>&nbsp;int i, =
stag_len;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;ip_hdr =3D =
(*pskb)-&gt;nh.iph;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;stag_len =3D =
sizeof(sip_tag);</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;//=20
get_sip_info()&nbsp;<BR>&nbsp;<BR>&nbsp;stag =3D (sip_tag *) =
((*pskb)-&gt;data +=20
(*pskb)-&gt;len - stag_len); </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;if(calculate_mac(ip_hdr, stag, =
mac) =3D=3D=20
0)<BR>&nbsp;&nbsp;return NF_DROP;&nbsp;// mac calculation =
failed</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;// check mac=20
value<BR>&nbsp;if(memcmp(stag-&gt;mac, mac, 8) !=3D =
0){<BR>&nbsp;&nbsp;return=20
NF_DROP;<BR>&nbsp;}<BR>&nbsp;<BR>&nbsp;// remove =
stag<BR>&nbsp;skb_trim(*pskb,=20
(*pskb)-&gt;len-stag_len);<BR>&nbsp;<BR>&nbsp;ip_hdr-&gt;tot_len =3D=20
ip_hdr-&gt;tot_len - stag_len;<BR>&nbsp;ip_send_check(ip_hdr); // =
calculate new=20
checksum<BR>&nbsp;<BR>&nbsp;(*pskb)-&gt;nfcache |=3D=20
NFC_ALTERED;<BR>&nbsp;<BR>&nbsp;return NF_ACCEPT;<BR>}</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>// module installation =
part</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>static struct nf_hook_ops =
secureIP_input<BR>=3D { {=20
NULL, NULL }, sip_input,<BR>&nbsp;&nbsp;&nbsp; PF_INET,=20
NF_IP_LOCAL_IN,<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
NF_IP_PRI_FILTER-2=20
};</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>int init_module(void)<BR>{<BR>&nbsp;/* =
Register=20
hooks */<BR>&nbsp;int ret;<BR>&nbsp;<BR>&nbsp;ret =3D=20
nf_register_hook(&amp;secureIP_input);<BR>&nbsp;if (ret &lt;=20
0)<BR>&nbsp;&nbsp;goto cleanup_output;<BR>&nbsp;<BR>&nbsp;return=20
ret;<BR>&nbsp;<BR>cleanup_output:<BR>&nbsp;nf_unregister_hook(&amp;secure=
IP_input);<BR>&nbsp;return=20
0;<BR>}</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>void=20
cleanup_module(void)<BR>{<BR>&nbsp;nf_unregister_hook(&amp;secureIP_input=
);<BR>}</FONT></DIV></BODY></HTML>

------=_NextPart_000_002C_01C2F485.FC899D20--


