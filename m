From: Patrick Schaaf <bof@bof.de>
Subject: Re: --set-mark limit
Date: Tue, 18 Jun 2002 20:52:49 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020618205249.A3455@oknodo.bof.de>
References: <20020618130639.2ec22286.mt@open2web.com> <200206181802.g5II2pA29007@Networker.rockstone.co.uk> <3D0F7C6A.BED7E33F@multibroker.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <3D0F7C6A.BED7E33F@multibroker.com.br>; from ryche@multibroker.com.br on Tue, Jun 18, 2002 at 03:31:06PM -0300
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
Content-Transfer-Encoding: 7bit
To: "Luiz Fernando T. Campos" <ryche@multibroker.com.br>
Cc: Netfilter Mailing List <netfilter@lists.samba.org>

> I have several links to limit the bandwidth,
> so I need to know what is the maximum value
> for the --set-mark value in the mangle table

It's an unsigned 32 bit value, so the maximum is 4294967295.

> I need something near a thousand diferent marks
> if someone knows that it will work or if I need a patch, 

It will work for you, at least in this respect.

best regards
  Patrick


