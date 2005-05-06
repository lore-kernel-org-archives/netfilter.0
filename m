From: "Robert Becskei" <brobiwbe@stcable.co.yu>
Subject: Re: Iptables, php , realtime bandwidth usage
Date: Fri, 6 May 2005 16:30:50 +0200
Message-ID: <001e01c55248$33d22460$1701a8c0@info2000256>
References: <000e01c5515e$b0b62570$1701a8c0@info2000256><427A3E1C.3070803@riverviewtech.net>
	<f48e768e050505102175ad27b4@mail.gmail.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello,

 thanx for all the responses, but those tools arent exactly what I'm looking 
for (and maybe I need to practice english a bit more as well :) ).

 example :

 computers----router----proxy---gateway---internet

 computer1 192.168.1.10
 computer2 192.168.1.11
 computer3 192.168.1.12

 at the router I would like to see that at that moment how much bandwithd is 
being used.
 for example I would like to see something like this (example) :

 computer1  download 10kbyte/s  upload 1.5kbyte/s
 computer2 download 0kbyte/s upload 0kbyte/s
 computer3 download 20kbyte/s upload 2kbyte/s

 my problem is (I currently use cacti, and bigsister), that I cannot see how 
is my bandwidthd currenly used on a per host basis.
 I can see graphs about that my current download and upload is this and that 
(overall), but I would like to see something as shown
 above in the example, I wonder if there is some tool for that ?

Sincerely
Robert Becskei


----- Original Message ----- 
From: "Glaucius Djalma Pereira Junior" <glaucius@gmail.com>
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: <netfilter@lists.netfilter.org>
Sent: Thursday, May 05, 2005 19:21
Subject: Re: Iptables, php , realtime bandwidth usage


use it

http://ifmonitor.preteritoimperfeito.com/



On 5/5/05, Taylor, Grant <gtaylor@riverviewtech.net> wrote:
> >  I wonder if someone could help me find something similiar to this :
> >
> >  -can monitor bandwidthd usage in real time (php maybe...)
> >
> >  -if possible it could resolve ip address to dns name ? ( I have setup 
> > my own dynamicdns dhcp server combo )
>
> You may want to look in to some of the SNMP monitoring tools (two come to 
> mind MRTG and Cacti) as they will do a lot of the graphics and graphical 
> web access for you.  However to do this you will either need a manged + 
> SNMP capable switch to watch which port each computer is plugged in to or 
> you will need to set up some sort of rules for counting on your router / 
> firewall and then set up some sort of SNMP package on the router / 
> firewall to point your SNMP monitoring app at.
>
> As far as getting close to real time stats you could set up some iptables 
> rules to easily count what passes through the router in each direction for 
> each client.  You may want to look at the accounting matches as they are 
> designed explicitly for this or just basic packet matching rules will work 
> too.  One word to the wise (unless there is a way to defeat this) the 
> bytes and packet counters on iptables output will start rounding at some 
> point, I'm not sure where, so you may want to pass the -Z option to zero 
> out the counters periodically (each polling cycle) to make sure that you 
> get all packets and not loose them to rounding.
>
>
> Grant. . . .
>
>


-- 
Glaucius Djalma Pereira Junior
glaucius@gmail.com



