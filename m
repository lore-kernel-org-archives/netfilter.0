From: Nicolas Mailhot <Nicolas.Mailhot@laPoste.net>
Subject: Re: repeated failed logons and ignoring them
Date: Mon, 26 Jun 2006 16:20:35 +0200
Message-ID: <449FED33.1010607@laPoste.net>
References: <200606260702.57739.tyche@ica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: Quoted-Printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: tyche <tyche@ica.net>
Cc: netfilter@lists.netfilter.org

tyche a =C3=A9crit :
> over the last few days, my server has been attacked. i would=20
> like to limit remote logon attempts by address so that if=20
> someone tries to logon from an ip address and fails 3 times,=20
> my computer will ignore repeated attempts from that ip=20
> address. any idea how to make a rule for this?

You want to try something like pam_abl

--=20
Nicolas Mailhot

