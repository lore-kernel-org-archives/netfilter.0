From: gadgeteer@elegantinnovations.org
Subject: Re: FTP-SSL explicit
Date: Sun, 22 Aug 2004 15:24:26 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040822212426.GA3446@hyper>
References: <810BC538117E9F4E9BB152E0C100DF1F18F5D2@farmer.vikus.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Aug 09, 2004 at 04:27:03PM -0400, Patrick Ahler (patrick@vikus.com) wrote:
> Does anyone know off hand which ports I need to open on my
> gateway/firewall for ftp over ssl (explicit) besides port 990???

ftp_tls explicit?  Is this something new?  In setting up our
implementation last spring I saw no mention of "explicit" in any of the
specification documents.

[a bit of googling]

ah... I see.  You will have to consult your software vendor as this
implicit/explicit distinction falls outside of the ftp_tls
specification.

Have fun,
-- 
Chief Gadgeteer
Elegant Innovations

