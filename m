From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: iptables abilities
Date: Fri, 23 Jan 2004 08:33:45 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079.12.75.166.26.1074864825.squirrel@nmibwkrf1.nexusmgmt.com>
References: <400FC047.4010208@objeng.ch>
    <1089.12.75.166.13.1074782849.squirrel@nmibwkrf1.nexusmgmt.com>
    <4010E263.1080902@objeng.ch>
    <200401230911.08584.Antony@Soft-Solutions.co.uk>
    <4010F62A.7090403@objeng.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4010F62A.7090403@objeng.ch>
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
To: Sven Burgener <sburgener@objeng.ch>
Cc: netfilter@lists.netfilter.org

> Antony Stone wrote:
>> The only reason you can't route private addresses across the Internet is
>> that
>> all ISP routers drop packets sent to these address ranges.
>
> Right.
>
>> You would set up your VPN system to forward these packets, just the same
>> as
>> you can set up your own firewalls and routers to forward them if you
>> want to.
>>
>> A VPN with two RFC1918 ranges at each end is a very common setup.
>
> Yes, indeed.
>
> My question, though, is how can a connection be established between two
> parties where one of them has a private address (A) and where you want
> to connect _to_ the server having the private address (A, see below).
>
> The problem is, you can't establish a connection to the private address
> (A), so there has to be a means of 'hijacking' the established session
> (from X, see diagram below).
>
>
>          (Internet)       (Internet)
>      A <------------> X <------------> B
>
> A: 192.168.X.X
> B: 192.168.X.X
> X: public IP address
>
> The end result is to get from B to A, securely.
>
> Cheers
> Sven
>

I don't know if it is what you are looking for but Bart Smit of Nexus
Management developed an application to allow Nexus Management to provide
remote control Help Desk to sites where we did not have a VPN connection. 
I do not know many of the details but I think the two stations connect to
each other through a third public server as you have described here.  The
two private computers do not require dedicated public IP addresses.  I
believe port address translation is all that is needed.

I do not know if it can be readily adapted to other services besides
remote control.  I do not know if the application is licensed under GPL or
if it is proprietary and available from Nexus for a fee.  If it is of
interest to you, let me know and I'll find out - John

-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


