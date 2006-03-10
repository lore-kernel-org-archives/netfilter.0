From: "Randy Grimshaw" <rgrimsha@syr.edu>
Subject: Re: Why is ipset nethash set type limited to /31?
Date: Thu, 09 Mar 2006 23:24:34 -0500
Message-ID: <s410b957.065@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org, menno@netboxblue.com

<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu
>>> Menno Smits <menno@netboxblue.com> 03/09/06 10:36 PM >>>
> Is there a reason why the ipset's nethash set type can't be used with
> single IPs (/32) as well as larger networks? I'd really like to be able
> to use networks and IPs in the same set.

you cannot have a legitimate network with only one address. you also need =
a network address (x.x.x.0) and a broadcast address (x.x.x.3) and two =
addresses for the communicating systems to use (x.x.x.1 and x.x.x.2)

Mircosoft windows and other OS's also enforce this so a /32 isn't =
practical.....   but...

I understand your idea though, I needed to define several nearly duplicate =
rules for NET and IP hashes in our gateway application. Fortunately the =
cost is minimal compared to the overall efficiency gained by using IPset. =
(A fabulous tool that needs to become mainstream).

<><Randy


