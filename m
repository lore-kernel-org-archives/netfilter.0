From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: FTP-SSL explicit
Date: Mon, 9 Aug 2004 21:32:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408092132.35073.Antony@Soft-Solutions.co.uk>
References: <810BC538117E9F4E9BB152E0C100DF1F18F5D2@farmer.vikus.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <810BC538117E9F4E9BB152E0C100DF1F18F5D2@farmer.vikus.net>
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

On Monday 09 August 2004 9:27 pm, Patrick Ahler wrote:

> Does anyone know off hand which ports I need to open on my
> gateway/firewall for ftp over ssl (explicit) besides port 990???

I don't know, but I know how you can find out.

Add a LOG rule at the end of your FORWARD chain (just before the packets get 
DROPped), and see what's trying to get between client & server.

That'll tell you what you need to add as an ACCEPT rule.

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


