From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: --set-mark limit
Date: Tue, 18 Jun 2002 19:45:12 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206181845.g5IIjDA31438@Networker.rockstone.co.uk>
References: <20020618130639.2ec22286.mt@open2web.com> <200206181802.g5II2pA29007@Networker.rockstone.co.uk> <3D0F7C6A.BED7E33F@multibroker.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D0F7C6A.BED7E33F@multibroker.com.br>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.samba.org>

On Tuesday 18 June 2002 7:31 pm, Luiz Fernando T. Campos wrote:

> hello guys,
>
> I have several links to limit the bandwidth,
> so I need to know what is the maximum value
> for the --set-mark value in the mangle table

According to the source code, it's an unsigned long, which on my machine 
means you can use values from 0 to (2^32)-1 = 4294967295

Should be enough for your purposes :-)

 

Antony.

