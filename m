From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: h.323 firewall
Date: Thu, 14 Nov 2002 21:37:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021114213744.4915ab70.arnt@c2i.net>
References: <000d01c28c0a$473ff290$057ba8c0@wxcsmtp450>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c28c0a$473ff290$057ba8c0@wxcsmtp450>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 14 Nov 2002 19:18:48 +0100, 
"vincent blondel" <vincent.blondel@chello.be> wrote in message 
<000d01c28c0a$473ff290$057ba8c0@wxcsmtp450>:

> Hi,
> 
> I want to implement in our organisation a complete video conferencing
> infrastructure but I am completely novice
> in this matter. I read a lot of documentation these last days but
> there are some points that stay not clear.
> 
> As you can see it above, we want to open domains DEV1 and DEV2 to the
> net for h.323 traffic.
> 
> The current situation incorporates :
> 
>           10.66.0.xxx
>      +---------------+
>      | SMC7008BR |
>      +---------------+
>           10.66.1.xxx
>                    DEV2
>                 |           |
>   +---------+-+   +--+--------+
>   | slack 8.0 |   | Slack 8.0 |
>   +-----------+   +-----------+
>                       192.168.0.xxx   +-----+       10.66.0.xxx
>                                              | pp0 | 
>                                              | +---------------+
>                                              +--+--+  |   switch     
>                                              |
>                                                  |       +-----------
>                                                  |       ----+
>                                                  |         DMZ
>                                                  +-------+ 
>                                                  +-------------+
>                                                  |  NS2  |   | NS1
> |
>                       10.66.0.xxx          |  HTTP2| | HTT1        |
>                  +---------------+         +-------+  | FTP          
>                  +--ISP
>                  |  SMC7008BR|                        | SMTP       |
>                  +---------------+                       
>                  +-------------+
>                   192.168.0.xxx                           
>                   192.168.0.xxx
>                      DEV1
>                   |            |
>  +-----------+-+      +-+---------+
>  |   linux         | .... |    w2k      |
>  +-------------+      +-----------+
>   GnomeMeeting         NetMeeting
> 
> - a firewall iptables on NS1 and NS2
> - communcication with the net is passing through our DMZ zone
> - DMZ integrates 2 servers linux slackware 8.0 / kernel 2.4.18 /
> patch-o-matic-20020825 / iptables 1.2.7a
> - DMZ is configured with nat feature for traffic between DEV1/DEV2 and
> the net
> - DEV1/DEV2 includes some 15 users with webcams and/or H323 compliant
> equipment.
> 
> So the problems I encounter are the following :

...a wee problem in your ascii artwork: 
try again with a _constant_width_ font.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



