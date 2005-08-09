From: "Lotte Mygind (AH/LMD)" <lotte.mygind@ericsson.com>
Subject: RE: Export code for Netfilter/iptables
Date: Tue, 9 Aug 2005 10:33:08 +0200
Message-ID: <388032EC32FD7A46AB01D59B3396E058B27BEC@esealmw107.eemea.ericsson.se>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: "curby ." <curby.public@gmail.com>
Cc: netfilter@lists.netfilter.org

Of course we review the licensing, bugs, IPR issues etc - but if we =
cannot get a little help from the project/documentation, it does become =
a tremendous task to make thorough reviews for all open source =
components.

My offer to add an entry to the FAQ had two purposes:
1) Offer a bit of help to the project (I will not be the last person to =
ask that question)
2) If I could get such a text into the FAQ that would mean that I would =
feel more confident that the text was truthful and just a random answer =
from some random person on this list...

/Lotte

-----Original Message-----
From: curby . [mailto:curby.public@gmail.com]
Sent: 8. august 2005 21:02
To: Lotte Mygind (AH/LMD)
Cc: netfilter@lists.netfilter.org
Subject: Re: Export code for Netfilter/iptables


On 8/8/05, Lotte Mygind (AH/LMD) <lotte.mygind@ericsson.com> wrote:
> We are going to use Netfilter/iptables in a product. In order to =
obtain an export code, I need to document whether these components =
implement any kind of encryption - so my questions are:

I hope that as part of the process of considering ANY third party code
in your products, a code review would be done to explore security
risks as well as possible gotchas with respect to licensing and
government regulations.  Such a review would certainly reveal if
cryptography was employed.  If someone on this list said that there
was or was not crypto code in netfilter, your company would not be
wise to trust them without independent verification anyway.

http://netfilter.org/licensing.html is unrelated but probably important =
as well.

