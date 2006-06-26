From: "Shane Spencer" <shane@bogomip.com>
Subject: Re: repeated failed logons and ignoring them
Date: Mon, 26 Jun 2006 09:48:39 -0800
Message-ID: <b19ddd5a0606261048k34344320qdb86dd5f0cd2bdbd@mail.gmail.com>
References: <200606260702.57739.tyche@ica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200606260702.57739.tyche@ica.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: tyche <tyche@ica.net>
Cc: netfilter@lists.netfilter.org

fail2ban is a configuratble daemon for doing just this.. it has a good
default config for ssh and some templates for apache/etc...

Shane

On 6/26/06, tyche <tyche@ica.net> wrote:
> over the last few days, my server has been attacked. i would
> like to limit remote logon attempts by address so that if
> someone tries to logon from an ip address and fails 3 times,
> my computer will ignore repeated attempts from that ip
> address. any idea how to make a rule for this?
>
> tia
>
> tyche
> --
> Win9x
>
> A 32 bit extention
> to a 16 bit patch
> for a 8 bit operating system
> on a 4 bit machine
> by a 2 bit company
> that cant stand 1 bit of competition
>
> -----------------------------------------------------------------------------
>     This Email is powered by ICA Canada OnLine
>          http://www.icacanadaonline.com
>
>
>

