From: Jason Opperisano <opie@817west.com>
Subject: Re: MSN file transfer block in iptables ?
Date: Mon, 14 Mar 2005 19:09:37 -0500
Message-ID: <1110845376.4516.1.camel@hubcap.ljm.dom>
References: <000d01c5281c$8bb2bfb0$0300000a@onur>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <000d01c5281c$8bb2bfb0$0300000a@onur>
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

On Sun, 2005-03-13 at 17:32, Onur ARABACI wrote:
> How can i disable msn file transfer ?

according to:

http://www.microsoft.com/technet/prodtechnol/winxppro/deploy/worki01.mspx

msn file transfers use TCP 6891=E2=80=936900.

i'd start by blocking those.

-j

--
"Please do not offer my god a peanut"
	--The Simpsons


