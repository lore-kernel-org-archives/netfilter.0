From: "Evan Borgstrom" <evan@unixpimps.org>
Subject: Re: Strange setup
Date: Sun, 19 Jan 2003 17:00:10 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1693.10.35.120.83.1043013610.squirrel@mail.unixpimps.org>
References: <1648.10.35.120.83.1043012159.squirrel@mail.unixpimps.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1648.10.35.120.83.1043012159.squirrel@mail.unixpimps.org>
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


> Now the problem:
> Because of the advertisments comming over the WLAN I now have about 40
> routes in the kernel routing table. Most of them are not very specific
> since we advertise our ISP's blocks to each other, so I have routes for
> /16's, /21's, etc... What happens is when someone that resides in one of
> these blocks that I'm getting advertisements for tries to access an
> address in my /29 their return path follows the advertisment over the
> WLAN.

I guess I need to explain this a little more.
The WLAN uses RFC1918 IP space and therefore requires it to be NAT'd when
it leaves one of the other nodes on the WLAN. This causes the return
packet to the user who made the request to the /29 to be different and
causes them to be dropped.


-- 
Evan Borgstrom <evan@unixpimps.org>
http://www.unixpimps.org - SIG:ILL



