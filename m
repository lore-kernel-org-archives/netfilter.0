From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Nice ZoneAlarm that might be useful for Iptables
Date: Wed, 01 Jun 2005 10:12:36 +0800
Message-ID: <429D1994.8070809@linuxmail.org>
References: <429BDF9F.7070707@mindspring.com>	<20050531043310.GF3681@der-frank.org>
	<Pine.LNX.4.60.0505311407460.5267@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0505311407460.5267@darkstar.sysinfo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>

R. DuFresne wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> 
> Zone alarm tends to run on single user systems, and is geared well for 
> that kind of access.  Imagine trying to allow 1500 users the ability to 
> control your fw rules to do something similiar in a production 
> multi-user env, from various systems forwarding through the fw in both 
> directions.
> 
> How many gatekeepers would it take to keep an eye on this kind of setup?
> And how well trusted are your average users?
> 
> 
> Perhaps on a standalone linux desktop this might be feasible, but, 
> certainly not in a real working env.

I disagree. We do not have to provide a Zone Alarm clone. Its 
functionality of checking what processes can use the network though 
would be useful in providing mandatory controls on what processes get to 
talk to the outside world.

Right now there is simply no such ability. Having this on say a server 
will prevent users from looking around the network if they have shell 
access or sending info/data out. Obviously only root should be able to 
see the list of process names allowed and the other conditions like uid 
and ports allowed to use by the process.

