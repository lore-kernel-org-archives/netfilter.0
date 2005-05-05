From: Chadley Wilson <chadley@pinteq.co.za>
Subject: Re: forward packets directly to net?
Date: Thu, 5 May 2005 12:33:03 +0200
Message-ID: <200505051233.03745.chadley@pinteq.co.za>
References: <200505051153.52443.chadley@pinteq.co.za>
	<200505050623.11868.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200505050623.11868.Alistair@nerdnet.ca>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thursday 05 May 2005 12:23, Alistair Tonner wrote:
> On May 5, 2005 05:53 am, Chadley Wilson wrote:
> > Greetings friends
> >
> > I hope I explain this correctly, Please try and help me here, I am
> > seriously stuck
Thanks Alistair

here is the whole file, there are no external Inet ips so it should be fine

### Firewall Setup #####
##config
set -x
ipt="/usr/sbin/iptables"
ext="eth0"
int="bond0"
chad="192.168.2.5"
etel="196.25.100.28"



#Enable IP Forwarding
echo "1" >> /proc/sys/net/ipv4/ip_forward


#Clear All Tables
${ipt} -t filter -F
${ipt} -t nat -F


## allow all from local interfaces [localhost]
${ipt} -t filter -A INPUT -s 127.0.0.1 -j ACCEPT


#Allow all prerouting
${ipt} -t nat -A PREROUTING -s 192.168.2.0/255.255.255.0 -j ACCEPT
${ipt} -t nat -A PREROUTING -s 196.25.100.5/255.255.255.0 -j ACCEPT


## allow pings
${ipt} -t filter -A INPUT -p icmp -j ACCEPT


## keep established connections on all interfaces
${ipt} -t filter -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
${ipt} -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT


## masquerade int outgoing to internet
${ipt} -t nat -A POSTROUTING -o ${ext} -s ${chad} -j MASQUERADE
${ipt} -t filter -A FORWARD -i ${int} -o ${ext} -s ${chad} -j ACCEPT


## accept www from internet [ext]
${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 80 -j ACCEPT


## accept SSH from outside limit by IP,and on local interfaces
${ipt} -t filter -A INPUT -i ${ext} -s 196.25.100.28 -p tcp --dport 22 -j 
ACCEPT
${ipt} -t filter -A INPUT -i ${int} -p tcp --dport 22 -j ACCEPT


## accept incoming SMTP
${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 25 -j ACCEPT
"/etc/rc.d/iptables" 94L, 2645C                                



## accept external POP3
${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 110 -j ACCEPT


##Allow ftp
${ipt} -t nat -A POSTROUTING -o ${ext} -s ${chad} -p tcp --dport 20:21 -j 
MASQUERADE
${ipt} -t filter -A FORWARD -i ${int} -o ${ext} -s ${chad} -p tcp --dport 
20:21 -j ACCEPT


##Allow mail from ext to int
${ipt} -t filter -A FORWARD -p tcp -m tcp -m state -s ${chad} -d 196.25.100.21 
-o ${ext} --sport 25 --state NEW,ESTABLISHED,RELATED -j ACCEPT
${ipt} -t filter -A FORWARD -p tcp -m tcp -m state -s ${chad} -d 196.25.100.21 
-o ${ext} --sport 110 --state NEW,ESTABLISHED,RELATED -j ACCEPT


##Allow DNS updates
${ipt} -t filter -A INPUT -i ${int} -p tcp --dport 53 -j ACCEPT
${ipt} -t filter -A INPUT -i ${ext} -p tcp --dport 53 -j ACCEPT

##Allow {chad} to 28 direct
${ipt} -t nat -A POSTROUTING -o ${ext} -s ${chad} -d ${etel} -p tcp -m tcp 
--dport 80 --state NEW,ESTABLISHED,RELATED -j MASQUERADE
${ipt} -t filter -A FORWARD -p tcp -m tcp -s ${chad} -d ${etel} -o ${ext} 
--dport 80 -j ACCEPT



## accept all from local interfaces
${ipt} -t filter -A INPUT -i ${int} -j ACCEPT
${ipt} -t filter -A INPUT -i ${int} -j ACCEPT


## drop all the rest, incoming , and forward between interfaces
#${ipt} -t filter -A INPUT -j DROP
#${ipt} -t filter -A FORWARD -j DROP

### END OF FIREWALL ###


I am still a nebie to iptables so if you think something could be better, I 
open for suggestions and :) better rules :)

Thanks
-- 
Chadley Wilson
Redhat Certified Technician 
Cert Number: 603004708291270
Pinnacle Micro
Manufacturers of Proline Computers
====================================
Exercise freedom, Use LINUX
=====================================


