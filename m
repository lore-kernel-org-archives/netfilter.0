From: Thomas Heinz <creatix@hipac.org>
Subject: Re: h.323 firewall
Date: Fri, 15 Nov 2002 11:57:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DD4D315.9040100@hipac.org>
References: <000d01c28c0a$473ff290$057ba8c0@wxcsmtp450>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vincent blondel <vincent.blondel@chello.be>
Cc: netfilter@lists.netfilter.org

Hi Vincent

You wrote:
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
>                                              | pp0 |  +---------------+
>                                              +--+--+  |   switch      |
>                                                  |       +---------------+
>                                                  |         DMZ
>                                                  +-------+  +-------------+
>                                                  |  NS2  |   | NS1
> |
>                       10.66.0.xxx          |  HTTP2| | HTT1        |
>                  +---------------+         +-------+  | FTP           +--ISP
>                  |  SMC7008BR|                        | SMTP       |
>                  +---------------+                        +-------------+
>                   192.168.0.xxx                            192.168.0.xxx
>                      DEV1
>                   |            |
>  +-----------+-+      +-+---------+
>  |   linux         | .... |    w2k      |
>  +-------------+      +-----------+
>   GnomeMeeting         NetMeeting

The formatting is somewhat broken ;-)

> - I read yesterday that it is possible to concentrate h.323 connections on a
> gatekeeper as OpenH323 Gatekeeper
>   ... do you think I have to use a gatekeeper with iptables ???

Yes, I'd recommend it. You might want to take a look at
http://www.gnugk.org. I'm using it in my private lan and it works just 
fine although my lan's topology is a little simpler than yours ;-)

> So maybe you can find my questions stupid or without any sense but I repeat
> it I got no experience with this.

Your questions are definitely not stupid.

> So, with information I received I imagine to impelement my h.323
> infrastructure as mentionned below.
> 
> - configuring iptables on NS1 (10.66.0.1) with the script mentionned above
> and replacing PCA_HOST with ip adress of NS2 (10.66.0.2)
> - installing OpenH323 gatekeeper on NS2 (10.66.0.2)
> - configuring all clients with gatekeeper NS2 (10.66.0.2).

What about using gatekeepers only? You can use gk's on NS1 and NS2 which
define each other as neighbours. Although I haven't tested this, it
should work.

With gnugk you can restrict the dynamic udp and tcp ports to stay
within a certain range whereby the range also restricts the number
of parallel connections. Anyway this solution implies that you have
to open all ports within the given ranges on NS1 in order to allow
incoming calls. This is not necessary for external calls.

Using netfilter's h323 module on NS1 would be a better solution
if you don't want to open the dynamic ports but I'm not sure whether
it works in your case. Just try it.

Please post your results as I believe that there are a lot of users
out there with similar problems.


Thomas


