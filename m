From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: public ip on LAN
Date: Fri, 02 Jan 2004 12:01:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1073062865.2993.31.camel@jasiiitosh.nexusmgmt.com>
References: <6.0.0.22.0.20040102214805.030494d0@orangeinfoways.com>
	 <1073060652.2993.19.camel@jasiiitosh.nexusmgmt.com>
	 <6.0.0.22.0.20040102223444.0305cdb0@amitpasari.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6.0.0.22.0.20040102223444.0305cdb0@amitpasari.com>
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
To: Amit Pasari <info@amitpasari.com>, netfilter@lists.netfilter.org

On Fri, 2004-01-02 at 12:11, Amit Pasari wrote:
> Thanks John,
> Let me explain
> on My LAN i have ip address - 172.16.1.1
> subnet - 255.255.0.0
> on My WAN i have ipaddress - 203.122.51.178
> subnet - 255.255.255.240
> 
> Now , my clients want to have public / Live ip instead of private ips which 
> i am giving as  many of my clients uses webserver , and other applications 
> which people from outside world needs to access .
> I can redirect  ports for one clients but how about 10 clients wanting the 
> same .
> So i need to give them a public ip so that all the traffic can be 
> redirected their ip .
> 
<snip>
Ah, now I think I understand.  You will want to use the SNAT and DNAT
targets in iptables.  The documentation in Oskar Andreasson's tutorial
is quite good.  There are probably some good GUI tools available to make
this easier such as fwbuilder.  As soon as ISCS is done
(http://iscs.sourceforge.net), we should be able to make this much
easier.
Depending on the application, you may be able to get around the need to
allocate them public addresses altogether by using an appropriate
application proxy or one of the iptables helpers.  What applications are
they using that they think they need public ip addresses?

-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


