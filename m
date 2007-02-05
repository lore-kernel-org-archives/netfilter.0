From: "Shakthi Kannan" <x86processor@gmail.com>
Subject: Re: H.323 or E.164 Extension
Date: Mon, 5 Feb 2007 20:58:23 +0530
Message-ID: <d0fd52cd0702050728t675f6e6bgb0c22ffe9a9c43e5@mail.gmail.com>
References: <BAY122-F735171EF719ECFD260C0FFF990@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY122-F735171EF719ECFD260C0FFF990@phx.gbl>
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
To: Tom Schemaitat <tom_schemaitat@hotmail.com>
Cc: netfilter@lists.netfilter.org

Hi Tom,

On 2/5/07, Tom Schemaitat <tom_schemaitat@hotmail.com> wrote:
> Is it possible to configure netfilter to route an inbound H.323 call to a
> private IP based on the H.323

Try the h323-conntrack-nat patches in patch-o-matic:

http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-5.html#ss5.3

SK

-- 
Shakthi Kannan
http://www.shakthimaan.com

