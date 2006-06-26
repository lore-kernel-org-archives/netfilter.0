From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: repeated failed logons and ignoring them
Date: Mon, 26 Jun 2006 14:11:47 +0200 (CEST)
Message-ID: <56122.193.173.147.3.1151323907.squirrel@webmail.sterenborg.info>
References: <200606260702.57739.tyche@ica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200606260702.57739.tyche@ica.net>
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
To: netfilter@lists.netfilter.org

On Mon, June 26, 2006 13:02, tyche wrote:
> over the last few days, my server has been attacked. i would like to li=
mit
> remote logon attempts by address so that if someone tries to logon from=
 an ip
> address and fails 3 times, my computer will ignore repeated attempts fr=
om that
> ip address. any idea how to make a rule for this?

What type of logon? SSH, telnet, ...?

There is a Netfilter authentication project called NuFW. You can find it =
at:
http://www.nufw.org/index.php3?lang=3Den.
Maybe it can help you accomplish what you need.


Gr,
Rob



