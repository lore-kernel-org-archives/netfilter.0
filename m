From: luoqiang <luoqiang@ict.ac.cn>
Subject: ip_conntrack.ftp.c and ip_nat_ftp.c and DNAT
Date: Tue, 18 Jun 2002 15:43:12 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <02061815431200.01908@luoqiang>
Reply-To: luoqiang@ict.ac.cn
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi,all

    After reading the hacking howto and the code of ip_conntack_ftp.c and
ip_nat_ftp.c,I want to write a module for DNAT to achieve the purpose as
follows:
iptables -A PREROUTING -t nat -p udp -d 159.226.1.1 --dport 5003
-j DNAT --to 192.168.1.2:5003

    I noticed that in ftp module,there are two  expected conntrack was set
 up. the one is setup in  line 220 in file ip_conntrack_ftp.c and the other
 is set up in line  284 in file ip_nat_ftp.c.
    For example,in port mode,client send port:192,168,1,2,128,8:

host A-------------->host B(Gateway)------------->host C
11.22.33.44-->1.2.3.4/192.168.1.1(port:32776)-->192.168.1.2:32776

  DNAT(192.168.1.2:32776<-->1.2.3.4 :32776)was set up.the first expected
conntrack was 11.22.33.44:0-->192.168.1.2:32776 and the second was
11.22.33.44:0-->1.2.3.4:32776.
   So I setup two expected conntrack too. one for
159.226.1.2:0-->192.168.1.2:5003 and the other for
159.226.1.2:0--159.226.1.1:5003
    In nat_expect function,I fill the struct ip_nat_multi_range[0] with ip
192.168.1.2 and port 5003.I think my every step was followed
ftp_module,expect I didn't fill the ftp_nat_info struct in conntrack in
connctrack module(I don't know for a normal udp conntrack,which struct should
I fill in ? ct.nat.info? and I think it's no use for me ).
    after insmod the conntrack module,in "/proc/net/ip_conntrack",I can see
"EXPECTING: proto=17 src=159.226.1.2 dst=159.226.1.2 sport=0 dport=5003" and
"EXPECTING: proto=17 src=159.226.1.2 dst=159.226.1.2 sport=0 dport=5003" in
/proc/net/ip_conntrack.but no DNAT happened. the function ip_nat_setup_info
returns 0.:-(

   I don't know where I made the mistake.I am very warried now,anybody can
tell me?
      ps:why I can't see expecting information in /proc/net/ip_conntrack
after insmod ip_conntrack_ftp.o and ip_nat_ftp.o?everything is worked well!

Thanks!
luoqiang

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
my code:
conntrack.c:
static int foo_help(const struct iphdr *iph, size_t len,
                       struct ip_conntrack *ct,
		       enum ip_conntrack_info ctinfo)
{
         /*set up expect conntrack 159.226.1.2:0--192.168.1.2:5003 */

              struct ip_conntrack_tuple t,mask;
	static int a=0;
               t = ((struct ip_conntrack_tuple)
		{ { 0x0201e29f, { 0 } },
		  { 0x0201a8c0, { htons(5003) }, IPPROTO_UDP }});
	mask = ((struct ip_conntrack_tuple)
		{ { 0xFFFFFFFF, { 0 } },
		  { 0xFFFFFFFF, { 0xFFFF }, 0xFFFF }});
	ip_conntrack_expect_related(ct, &t, &mask, NULL);
	info->initialized = 0;
	return NF_ACCEPT;
}

static struct ip_conntrack_helper foo = { { NULL, NULL },
					  { { 0, { 0 } },
					    { 0, { 0 }, IPPROTO_UDP } },
					  { { 0, { 0 } },
					    { 0, { 0 }, 0xFFFF } },
					  foo_help };
int init_module(void)
	{
               return ip_conntrack_helper_register(&foo);
       	 }
void cleanup_module(void)
       {
               ip_conntrack_helper_unregister(&foo);
       }


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
nat.c
  static int foo_nat_expected(struct sk_buff **pksb,
                          unsigned int hooknum,
                          struct ip_conntrack *ct,
                          struct ip_nat_info *info,
                          struct ip_conntrack *master,
                          struct ip_nat_info *masterinfo,
                          unsigned int *verdict)
  {
     struct ip_nat_multi_range mr;
     u_int32_t  newip;
     if (HOOK2MANIP(hooknum)==IP_NAT_MANIP_DST){
     newip = 0x0201a8c0;
     mr.rangesize=1;

     /* fill mr.range[0] with 192.168.1.2 and port 5003*/

     mr.range[0].flags |= IP_NAT_RANGE_PROTO_SPECIFIED;
     mr.range[0].min_ip = mr.range[0].max_ip = newip;
     mr.range[0].min = mr.range[0].max
                     = ((union ip_conntrack_manip_proto){ htons(5003) });
     *verdict = ip_nat_setup_info(ct, &mr, hooknum);
     return 1;
     }
  }

  static unsigned int foo_help(struct ip_conntrack *ct,
                  struct ip_nat_info *info,
                  enum ip_conntrack_info ctinfo,
                  unsigned int hooknum,
                  struct sk_buff  **pksb)
  {
     /*set up expect conntrack 159.226.1.2:0--159.226.1.1:5003 */

      struct ip_conntrack_tuple tuple =
      {{ 0x0201e29f ,{ 0 }},{0x0101e29f , { htons(5003) }, IPPROTO_UDP }};
      const struct ip_conntrack_tuple mask =
      {{ 0xFFFFFFFF,{ 0 }},{ 0xFFFFFFFF, { 0xFFFF }, 0xFFFF}};
      a = ip_conntrack_expect_related(ct,&tuple,&mask,NULL);
      return NF_ACCEPT;
      }

  static struct ip_nat_expect foo_expect = { { NULL, NULL }, foo_nat_expected
};

  static struct ip_nat_helper hlpr = { { NULL, NULL },
					  { { 0, { 0 } },
					    { 0, { 0 }, IPPROTO_UDP } },
					  { { 0, { 0 } },
					    { 0, { 0 }, 0xFFFF } },
					  foo_help , "test" };
int init_module(void)
{
       int ret;
       if ((ret=ip_nat_expect_register(&foo_expect))==0){
               ret=ip_nat_helper_register(&hlpr);
       if (ret!=0)
	       ip_nat_expect_unregister(&foo_expect);
       }
       return ret;
}

void cleanup_module(void)
{
       ip_nat_helper_unregister(&hlpr);
       ip_nat_expect_unregister(&foo_expect);
}


