From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: A simple question
Date: Wed, 18 Aug 2004 21:18:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <SERVER7QYx3G5aYY61L00000074@server7.bandwidthco.com>
References: <41241244.40804@svw.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41241244.40804@svw.com>
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
To: 'Sudheer Divakaran' <sudheer@svw.com>, 'Netfilter mailing list' <netfilter@lists.netfilter.org>

 
In almost all IP Tables articles I've found that the default policy of all
tables (INPUT,OUTPUT,FORWARD) set to DROP.  I can understand it as far as
INPUT and FORWARD tables are concerned, but I do not understand why should
we set the default policy of OUTPUT chain to DROP.  OUTPUT chain is
responsible for packets originating from the firewall itself.  
Whay should we DROP it?

Thanks,
Sudheer

What you say is indeed correct. Most of the articles on the subject do
recommend a default DROP on all three tables. However, I personally do set
my OUTPUT default to ACCEPT, while my FORWARD and INPUT are definitely set
to DROP. As you might expect, it is quite easy to DOS the firewall itself
when OUTPUT is set to DROP. And that is not a real good idea. However,
having said that, close scrutiny must be paid to what you allow out of the
firewall and the necessary rules must be in place.



