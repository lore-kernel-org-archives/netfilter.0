From: aksingh@hss.hns.com
Subject: Re: sysctl ip_queue_maxlen variable
Date: Thu, 15 Jul 2004 13:25:45 +0530
Sender: kernelnewbies-bounce@nl.linux.org
Message-ID: <OF600B447C.9F46562C-ON65256ED2.0029D649@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=EABBE441DFBA50D98f9e8a93df938690918cEABBE441DFBA50D9"
Return-path: <kernelnewbies-bounce@nl.linux.org>
Content-Disposition: inline
Errors-to: kernelnewbies-bounce@nl.linux.org
List-help: <mailto:ecartis@nl.linux.org?Subject=help>
List-unsubscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=unsubscribe>
List-software: Ecartis version 1.0.0
List-Id: <netfilter.vger.kernel.org>
List-subscribe: <mailto:kernelnewbies-request@nl.linux.org?Subject=subscribe>
List-owner: <mailto:riel@nl.linux.org>
List-post: <mailto:kernelnewbies@nl.linux.org>
List-archive: <http://mail.nl.linux.org/kernelnewbies/>
To: Sven Schuster <schuster.sven@gmx.de>
Cc: kernelnewbies@nl.linux.org, netfilter@lists.netfilter.org


--0__=EABBE441DFBA50D98f9e8a93df938690918cEABBE441DFBA50D9
Content-type: text/plain; charset=US-ASCII





Hi Sven,

  This is what I find in 2.4.20-8,

#define IPQ_QMAX_DEFAULT 1024
#define IPQ_PROC_FS_NAME "ip_queue"
#define NET_IPQ_QMAX 2088
#define NET_IPQ_QMAX_NAME "ip_queue_maxlen"


........................................................


      static inline int ( line 69)
__ipq_enqueue_entry(struct ipq_queue_entry *entry)
{
       if (queue_total >= queue_maxlen) { >>>> len being checked against
queue_maxlen >>>)
               if (net_ratelimit())
                       printk(KERN_WARNING "ip_queue: full at %d entries, "
                              "dropping packet(s).\n", queue_total);
               return -ENOSPC;
       }
       list_add(&entry->list, &queue_list);
       queue_total++;
       return 0;
}

.............................................................
and ... ( line 584)

static int sysctl_maxlen = IPQ_QMAX_DEFAULT;
static struct ctl_table_header *ipq_sysctl_header;

 >>> sysctl value for "ip_queue_maxlen goes into sysctl_maxlen, and besides these 3 or 4 line sysctl_maxlen is not used anywhere, nor is it assigned
to queue_maxlen anywhere >>>>

static ctl_table ipq_table[] = {
      { NET_IPQ_QMAX, NET_IPQ_QMAX_NAME, &sysctl_maxlen,
        sizeof(sysctl_maxlen), 0644,  NULL, proc_dointvec },
      { 0 }
};

static ctl_table ipq_dir_table[] = {
      {NET_IPV4, "ipv4", NULL, 0, 0555, ipq_table, 0, 0, 0, 0, 0},
      { 0 }
};

static ctl_table ipq_root_table[] = {
      {CTL_NET, "net", NULL, 0, 0555, ipq_dir_table, 0, 0, 0, 0, 0},
      { 0 }
};






Sven Schuster <schuster.sven@gmx.de>@nl.linux.org on 07/15/2004 12:21:27 PM

Sent by:    kernelnewbies-bounce@nl.linux.org


To:    Amit Kumar Singh/HSS@HSS
cc:    kernelnewbies@nl.linux.org, netfilter@lists.netfilter.org

Subject:    Re: sysctl ip_queue_maxlen variable



Hit Amit,

On Thu, Jul 15, 2004 at 11:17:22AM +0530, aksingh@hss.hns.com told us:
>
> Hi,
>
>   how does the sysctl ip_queue_maxlen variable
> work(net.ipv4.ip_queue_maxlen). This is used by the ip_queue.o module in
> the kernel to queue packets that have to be sent to user land using
netlink
> sockets. I felt that this sysctl variable helped us define the max length
> for the queue maintained by ip_queue.o, but when I looked at ip_queue.c ,
> the value for the sysctl variable is stored at &sysctl_maxlen, where as
> before enqueing a packet using the function __ipq_enqueue_entry, the
> present len is compared against the variable queue_maxlen and not against
> sysctl_maxlen, why is that so ?? so afterall is the queue max len
> configurable ?? i have tried using sysctl from command line on
> ip_queue_maxlen, it works fine and allows me to set it to any value
> sizeof(int), but is this value usde somewhere inside ip_queue, I could
not
> find that in ip_queue.c ... any clues ??

in which kernel version did you find this?? I've looked at 2.6.8-rc1
and 2.4.26, and in both kernel versions the variable used for the
sysctl and for checking in ip_queue.c. There is no variable
sysctl_maxlen in this file.

(from 2.4.26, around line 590):
static ctl_table ipq_table[] = {
 { NET_IPQ_QMAX, NET_IPQ_QMAX_NAME, &queue_maxlen,
   sizeof(queue_maxlen), 0644,  NULL, proc_dointvec },
  { 0 }
};

(from 2.4.26, around line 67, function __ipq_enqueue_entry):
       if (queue_total >= queue_maxlen) {
               if (net_ratelimit())
                       printk(KERN_WARNING "ip_queue: full at %d entries, "
                              "dropping packet(s).\n", queue_total);
               return -ENOSPC;
       }


HTH

Sven
>
> regards
> Amit

--
Linux zion 2.6.8-rc1 #3 Mon Jul 12 22:38:00 CEST 2004 i686 athlon i386
GNU/Linux
  08:45:07  up 2 days, 10:02,  1 user,  load average: 0.08, 0.06, 0.01
(See attached file: C.DTF)

--0__=EABBE441DFBA50D98f9e8a93df938690918cEABBE441DFBA50D9
Content-type: application/octet-stream; 
	name="C.DTF"
Content-Disposition: attachment; filename="C.DTF"
Content-transfer-encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMSAoR05V
L0xpbnV4KQ0KDQppRDhEQlFGQTlpbHZvNEZBZEIyUG5lUVJBdVl5QUo5eXpDVndmOE84MWZ3TFlm
OWVDZ1B3S0ZDZVpBQ2VQUzVKDQpBNUNuK2pFNDlHazc5b3lJVGNITmJTUT0NCj02a0pMDQotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K

--0__=EABBE441DFBA50D98f9e8a93df938690918cEABBE441DFBA50D9--


--
Kernelnewbies: Help each other learn about the Linux kernel.
Archive:       http://mail.nl.linux.org/kernelnewbies/
FAQ:           http://kernelnewbies.org/faq/

