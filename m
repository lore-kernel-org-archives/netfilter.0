From: Pavlos Parissis <p_pavlos@freemail.gr>
Subject: Re: Port 723?
Date: Tue, 5 Nov 2002 21:30:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021105213044.3d2ab609.p_pavlos@freemail.gr>
References: <E2913D4A-F0E6-11D6-AEC7-0030656EDEF8@art-ad.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E2913D4A-F0E6-11D6-AEC7-0030656EDEF8@art-ad.se>
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
To: netfilter@lists.netfilter.org

On Tue, 5 Nov 2002 18:49:08 +0100 pi <pi@art-ad.se> wrote:
>  Can anyone tell me what runs  on port 723?
>  After nmap <interface> i got this:
>  
>  723/tcp open unknown
Are you sure about that???
If it is 1723 then it is pptp service port.
After a quick search in google i found that

MOSIX uses:

TCP port 4660 for migration;

UDP port 5428 for information dessimination;

MFS uses TCP port 723.

Pavlos

-- 
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
I love having the feeling of being in control
while i have the sensation of speed

The surfer of life
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


