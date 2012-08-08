From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack output - question
Date: Wed, 8 Aug 2012 16:12:47 +0200
Message-ID: <20120808141247.GA1734@1984>
References: <CAAJpzgba1eL73KxNZWLU7DxJsrZitdb2WkUOe=An_J-Q677+sg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAAJpzgba1eL73KxNZWLU7DxJsrZitdb2WkUOe=An_J-Q677+sg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Aug 06, 2012 at 10:38:03PM -0700, Gomathivinayagam Muthuvinayagam wrote:
> Conntrack classifies a packet to a flow based on protocol no, srcip,
> destip, srcport, and destport.
> 
> A sample output is shown below,
> 
> [NEW] udp      17 30 src=192.168.2.100 dst=192.168.2.1 sport=57767
> dport=53 [UNREPLIED] src=192.168.2.1 dst=192.168.2.100 sport=53
> dport=57767
> 
> Here, what's the need of reply srcip, reply destip, reply srcport,
> reply destport? (Since we can imply these information from original
> srcp ip, original destip, original srcport, original destport)
> Is it just for avoiding for confusion, or anyother reasons behind this?

We need the reply tuple for NAT scenarios. In those cases, original
tuples does not match the reply tuple.
