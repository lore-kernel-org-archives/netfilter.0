From: "Anthony M. Rasat" <a.m.rasat@palangkaraya.speed.net.id>
Subject: Re: Traffic Reflecting / Redirecting
Date: Fri, 4 Apr 2003 12:13:48 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003e01c2fa68$f9f8cc50$7e00a8c0@speednet6>
References: <B45570C481D7904FA8C47E19444BF6CD030B1F@nsimail1.netstandard.inc>
Reply-To: "Anthony M. Rasat" <a.m.rasat@palangkaraya.speed.net.id>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Andrew,

I'm not an expert but I think what you need is called port forwarding. You
can look for an example - if you want to experiment yourself creating chains
which generated automatically - in http://www.morizot.net/firewall/gen and
costumize it for your need.

Regards,

Anthony M. Rasat.-



----- Original Message -----
From: "Andrew Brink" <abrink@netstandard.net>
To: <netfilter@lists.netfilter.org>
Sent: Friday, April 04, 2003 4:36 AM
Subject: Traffic Reflecting / Redirecting


All -

I am trying to set up a box that can reflect traffic to another box
transparently.

An Example would be:  Initiate a ssh connection to 10.1.1.1, 10.1.1.1
then sends this packet to 192.168.1.1, then the return path must also go
through 10.1.1.1.

The trick is getting this to work transparently, and over the internet,
not a local network.

Any thoughts or ideas would be helpful.

Thanks.

Andrew Brink, CCNA, WCSP
NetStandard, Inc.
913-262-3888






