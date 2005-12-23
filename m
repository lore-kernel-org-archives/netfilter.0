From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Spammer are using port 80 on my firewall to send spam
Date: Fri, 23 Dec 2005 07:19:51 -0500
Message-ID: <1135340391.30754.218.camel@siren.chrisbrenton.org>
References: <BAY7-F2612B87A52F804BFFDF04487330@phx.gbl>
Reply-To: cbrenton@chrisbrenton.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY7-F2612B87A52F804BFFDF04487330@phx.gbl>
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
To: netfilter <netfilter@lists.netfilter.org>

On Fri, 2005-12-23 at 01:30 -0500, Jacques Beaudoin wrote:
>
> Im getting hit by spammer on port 80 on my firewall thats is also running 
> squid.

Are you running Squid as an outbound proxy or a reverse proxy? If
outbound you should have a filter similar to:
acl localnet src <your_subnet>/<#_of_mask_bits>
http_access allow localnet

for example:
acl localnet src 192.168.1.0/24
http_access allow localnet

If you are running it as a reverse proxy, the host defined under
"httpd_accel_host" has a vulnerable script running on it. Check the URL
spammers have been connecting to in order to figure out which one it is.
Are you running form mail? That's a common target.

> If i open port 80 to my mail server via prerouting,  spammer wiill use
> my firewall to send spam.

Then, don't do that. ;-)

Actually, unless you are running Squid as an outbound proxy with
incorrect filters (see above) they are probably using your mail server.

HTH,
Chris



