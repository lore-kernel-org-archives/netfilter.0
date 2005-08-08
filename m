From: "curby ." <curby.public@gmail.com>
Subject: Re: Export code for Netfilter/iptables
Date: Mon, 8 Aug 2005 13:01:37 -0600
Message-ID: <5d2f379105080812012bf0884d@mail.gmail.com>
References: <388032EC32FD7A46AB01D59B3396E058B27BDB@esealmw107.eemea.ericsson.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <388032EC32FD7A46AB01D59B3396E058B27BDB@esealmw107.eemea.ericsson.se>
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
To: "Lotte Mygind (AH/LMD)" <lotte.mygind@ericsson.com>
Cc: netfilter@lists.netfilter.org

On 8/8/05, Lotte Mygind (AH/LMD) <lotte.mygind@ericsson.com> wrote:
> We are going to use Netfilter/iptables in a product. In order to obtain a=
n export code, I need to document whether these components implement any ki=
nd of encryption - so my questions are:

I hope that as part of the process of considering ANY third party code
in your products, a code review would be done to explore security
risks as well as possible gotchas with respect to licensing and
government regulations.  Such a review would certainly reveal if
cryptography was employed.  If someone on this list said that there
was or was not crypto code in netfilter, your company would not be
wise to trust them without independent verification anyway.

http://netfilter.org/licensing.html is unrelated but probably important as =
well.

