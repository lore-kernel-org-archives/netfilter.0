From: "Daniel F. Chief Security Engineer -" <danielf@supportteam.net>
Subject: Re: Is Linux based Gateway/Firewall feasible
Date: Thu, 8 Jul 2004 19:38:09 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407081938.09690.danielf@supportteam.net>
References: <40ED39B9.30608@svw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40ED39B9.30608@svw.com>
Content-Disposition: inline
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

In my experience I would use a router and a firewall as separate devices. I 
use Juniper routers and Linux firewalls. My network pushes about 800Mbs at 
peak, we have over 4000 servers. And I have found using linux firewalls as 
the gateway and then having the router in front to handle all of the WAN 
connections works out best. 

hope this helps.  


On Thursday 08 July 2004 07:10, Sudheer Divakaran wrote:
> Hi,
>
> I've a local LAN consisting of about 150 machines.  I'm using a machine
> with Linux + IPTables  as the gateway machine which inturn connects to
> two different ISPs.  My question is can a Linux based machine match the
> performance of a hardware based routers provided by Cisco,... OR is my
> decision to go for a Linux based solution is a wrong one?.
>
> Is there so much difference between these two solutions?
>
> Can I achieve the same performance using a high end PC and Linux?
>
> I'm asking this because one guy told me that my decision to go for a
> Linux based solution is a wrong one and it can never match the
> performance of hardware based Routers.
>
> Thanks
> Sudheer

-- 
"Unix IS user-friendly. It's just picky about who its friends are."
_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_,.-:*"``'*:-.,_
Daniel Fairchild - Chief Security Officer | danielf@supportteam.net
C I Host. 1851 Central Drive Suite 110. Bedford, TX 76021
T. 888.868.9931 ext 7103
F. 888.241.2294
http://www.cihost.com
-------------------------------------------
Privileged/Confidential Information may be contained in this message.  If
you are not the addressee indicated in this message (or responsible for
delivery of the message to such person), you may not copy or deliver this
message to anyone.  In such case, you should destroy this message and kindly
notify the sender by reply email.  Please advise immediately if you or your
employer do not consent to Internet email for messages of this kind.
Opinions, conclusions and other information in this message that do not
relate to the official business of my firm shall be understood as neither
given nor endorsed by it.

