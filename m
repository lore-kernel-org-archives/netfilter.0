From: Mike Ely <mike.ely@phoenix.k12.or.us>
Subject: Re: I would like to disallow  popups with iptables how can I accomplish that?
Date: Thu, 24 Apr 2003 10:07:54 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <49F8CCBE-7677-11D7-A56C-00039354EBD6@phoenix.k12.or.us>
References: <01a201c30abc$3bb62cb0$0f00a8c0@juancarlitos>
Mime-Version: 1.0 (Apple Message framework v552)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <01a201c30abc$3bb62cb0$0f00a8c0@juancarlitos>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: juanca <juanca@sat.com.py>
Cc: netfilter@lists.netfilter.org

Use Mozilla, Safari, Konqueror, Galeon, or Opera instead of Internet 
Explorer :)

AFAIK, there's no good way to block popup ads using iptables.  You can 
make a blacklist and manually add each pop-up company to it using -s 
l33t.popupz.adserver.com -j DROP or something, but that seems pretty 
cumbersome, and you will still have the windows opening - just nothing 
will fill them.

Alternatively, you can use a filtering proxy such as squidGuard, but 
again you will still have the windows opening.  You're better off just 
using a browser whose developers aren't as hamstrung by marketing 
departments as IEs.

Mike

On Thursday, April 24, 2003, at 04:50 PM, juanca wrote:

> hi everyone
>
>  I would like to avoid popups with iptables what rules do I have to
> implement?
>
>
> ---
> [This E-mail scanned for viruses by Declude Virus]
>
>

---
[This E-mail scanned for viruses by Declude Virus]


