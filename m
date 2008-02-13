From: Philip Prindeville <philipp@redfish-solutions.com>
Subject: Re: Who currently owns ip_conntrack_sip?
Date: Wed, 13 Feb 2008 00:33:24 -0800
Message-ID: <47B2AB54.1020305@redfish-solutions.com>
References: <47B279B9.4000202@redfish-solutions.com> <200802130925.05066.thomas.jarosch@intra2net.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060505090008080903060604"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200802130925.05066.thomas.jarosch@intra2net.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Thomas Jarosch <thomas.jarosch@intra2net.com>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------060505090008080903060604
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Thomas Jarosch wrote:
> Philip,
>
> On Wednesday, 13. February 2008 06:01:45 you wrote:
>   
>> I was using this module recently (added support to
>> arno-iptables-firewall and bundled it into AstLinux).  Works great.  A
>> real lifesaver.
>>
>> But I did have a couple of minor suggestions to make it more usable.
>>
>> Can the person who maintains it please contact me?
>>     
>
> Just post to this list, they will hear you.
>
> Though general discussions are better suited for
> the "netfilter" list if it's not development related.
>
> Thomas
>   

Ok.  I had a simple patch I'd like to see included that makes debugging 
output dependent on a load-time module parameter, i.e. "debug=1".

It's trivial.

I was also thinking that SIP typically either used as a single port 
(5060), or as a block of ports (5060:5080).

Allowing specifying eight individual sparse ports isn't really useful.

Specifying 4 ranges of ports would be a lot more handy.

How easily could this be done?

I'm working on the AstLinux project (http://www.astlinux.org) and we are 
releasing 0.60 to come with a couple of different firewall options that 
will both leverage this module.  In most of the deployments of AstLinux, 
our operational experience shows that one or two blocks of 5-40 ports is 
typical (i.e. 95% of all cases).

Thanks,

-Philip



--------------060505090008080903060604
Content-Type: text/plain;
 name="netfilter-sip.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="netfilter-sip.diff"

--- ip_conntrack_sip.c.orig	2007-10-17 12:31:14.000000000 -0700
+++ ip_conntrack_sip.c	2008-02-11 10:14:33.000000000 -0800
@@ -20,16 +20,16 @@
 #include <linux/netfilter_ipv4/ip_conntrack_helper.h>
 #include <linux/netfilter_ipv4/ip_conntrack_sip.h>
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(format, args...)
-#endif
-
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Christian Hentschel <chentschel@arnet.com.ar>");
 MODULE_DESCRIPTION("SIP connection tracking helper");
 
+static unsigned int debug = 0;
+module_param(debug, uint, 0);
+MODULE_PARM_DESC(debug, "debug=1 is turn on debug messages");
+
+#define DEBUGP(format, args...) if (debug) printk(KERN_DEBUG format, ##args)
+
 #define MAX_PORTS	8
 static unsigned short ports[MAX_PORTS];
 static int ports_c;
--- ip_nat_sip.c.orig	2007-10-17 12:31:14.000000000 -0700
+++ ip_nat_sip.c	2008-02-11 10:15:30.000000000 -0800
@@ -23,11 +23,11 @@
 MODULE_AUTHOR("Christian Hentschel <chentschel@arnet.com.ar>");
 MODULE_DESCRIPTION("SIP NAT helper");
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(format, args...)
-#endif
+static unsigned int debug = 0;
+module_param(debug, uint, 0);
+MODULE_PARM_DESC(debug, "debug=1 is turn on debug messages");
+
+#define DEBUGP(format, args...) if (debug) printk(KERN_DEBUG format, ##args...)
 
 struct addr_map {
 	struct {
--- nf_nat_sip.c.orig	2007-10-17 12:31:14.000000000 -0700
+++ nf_nat_sip.c	2008-02-11 10:16:06.000000000 -0800
@@ -25,11 +25,11 @@
 MODULE_DESCRIPTION("SIP NAT helper");
 MODULE_ALIAS("ip_nat_sip");
 
-#if 0
-#define DEBUGP printk
-#else
-#define DEBUGP(format, args...)
-#endif
+static unsigned int debug = 0;
+module_param(debug, uint, 0);
+MODULE_PARM_DESC(debug, "debug=1 is turn on debug messages");
+
+#define DEBUGP(format, args...) if (debug) printk(KERN_DEBUG format, ##args...)
 
 struct addr_map {
 	struct {

--------------060505090008080903060604--
