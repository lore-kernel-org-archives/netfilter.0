From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Blocking file transfer by type
Date: Mon, 24 Oct 2005 13:14:02 -0500
Message-ID: <200510241314.02987.rob0@gmx.co.uk>
References: <67c243f60510241107q5fc6741fj8dec3a740084e0cc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <67c243f60510241107q5fc6741fj8dec3a740084e0cc@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Monday 2005-October-24 13:07, Fabricio Lopes de Souza wrote:
> Hello guys , im trying to find a solution for this !
> I need to block some type of archives to get outside my network .
> Like images and AUTOCAD files .

And what about tar, zip, gzip and friends? Or worse: gpg? It's a lost 
cause, and you're starting out from way behind, as demonstrated by the 
fact that you posted this question here. It is not a netfilter issue, 
not even when using ugly hacks like L7 and -m string.

> I want a solution that not work with the extension of files ! :D
> Can you help me ?

No, but perhaps squid-cache.org could.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

