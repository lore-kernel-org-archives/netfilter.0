From: "ODEN,MARK THOMAS" <cerberus@ufl.edu>
Subject: [ netfilter ] Re: relocating packets [ not-spam ]
Date: Tue, 18 Oct 2005 15:34:16 -0400 (EDT)
Message-ID: <504138318.1129664056504.JavaMail.osg@osgjas04.cns.ufl.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

I followed Chapter 11 from lartc and did not get any results:

# iptables -A PREROUTING -i eth0 -t mangle -p tcp --dport 25
-j MARK --set-mark 1

# echo 201 mail.out >> /etc/iproute2/rt_tables
# ip rule add fwmark 1 table mail.out

# /sbin/ip route add default via 192.168.0.1 dev eth1 table 
mail.out

I did not receive any errors when setting the mark option, so I 
assume the warning at the bottom of that page does not apply,
but I don't know how to check if I have the proper options enabled 
or not.


** Also, how do I save changes to iptables and ip ?

~Mark

On Thu Oct 13 09:35:47 EDT 2005, /dev/rob0 <rob0@gmx.co.uk> 
wrote:

> On Thursday 2005-October-13 04:50, Mark Oden wrote:
>> Assuming I had two NICs in my machine that happen to be on the 
>> same
>> network, is there a way to force packets of certain ports to use 
>> only
>> one NIC or IP?
> 
> I believe this scenario is covered by the LARTC HOWTO.  In brief: 
> use "-j MARK --set-mark 0xff" in mangle. Use dual routing tables, 
> and a rule to put "fwmark 0xff" traffic in the alternate table. 
> The mark can be anything from 0x0 to 0xffff.
> 
> http://lartc.org/howto/
> --     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
> 
> 
> 



--
ODEN,MARK THOMAS


