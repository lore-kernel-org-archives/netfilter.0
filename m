From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Re: No PREROUTING for OUTPUT?
Date: Sun, 17 Oct 2004 14:10:24 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <06B6B683FC4088203BA6B8D7@[10.0.0.4]>
References: <5FCB4E67C52322BD4ABBF882@10.0.0.4>
	<3063e504101713315f8fb386@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3063e504101713315f8fb386@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Users <netfilter@lists.netfilter.org>

--On Sunday, October 17, 2004 11:31 PM +0300 George Alexandru Dragoi 
<waruiinu@gmail.com> wrote:

> The routing decision is done after OUTPUT chains in both nat and
> mangle tables, and before POSTROUTING of course. Is this what you
> meant?

Ah, so for the output path, I need to use "-t mangle -A OUTPUT" instead of 
"-A PREROUTING"? I just need to add the extra rule, then.

