From: Filip Sneppe <filip.sneppe@gmail.com>
Subject: Re: iptables mac destination filtering
Date: Thu, 28 Apr 2005 12:13:50 +0200
Message-ID: <9151ac2a05042803136de1b772@mail.gmail.com>
References: <1114681174.5821.19.camel@dhcp0-103.erasme.lan>
Reply-To: Filip Sneppe <filip.sneppe@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1114681174.5821.19.camel@dhcp0-103.erasme.lan>
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
To: Thomas Turquois <tturquois@erasme.org>
Cc: netfilter@lists.netfilter.org

Hi,

On 4/28/05, Thomas Turquois <tturquois@erasme.org> wrote:
> I would like to know why it's not possible to filter on mac destination
> address with iptables.

It's not possible with iptables since it works on the IP layer and higher,
but have a look at "ebtables", and maybe bridge-netfilter and arptables:

http://ebtables.sourceforge.net/

Regards,
Filip

