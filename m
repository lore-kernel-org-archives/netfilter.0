From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Filtering Nimda, Code Red and Code Red II
Date: Wed, 11 Sep 2002 09:59:03 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020911135903.GT7289@cannon.eng.us.uu.net>
References: <Pine.LNX.4.44.0209111237190.32463-100000@dns.toxicfilms.tv> <200209111248.g8BCmAv08513@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200209111248.g8BCmAv08513@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

On Wed, Sep 11, 2002 at 01:48:04PM +0100, Antony Stone wrote:

> On Wednesday 11 September 2002 11:42 am, Maciej Soltysiak wrote:
> 
> > The short answer is no. Netfilter is a packet filter, it works on 3rd and
> > 4th layer, You need a 5th layer application, like a proxy.
> 
> Folks: don't try looking up the 5th layer of the TCP networking model :-)

What's wrong with his statement? As Maciej said the 5th layer of the IP model
is the application layer:

                 --------------
      layer 5   |  application |
                 --------------
      layer 4   |  TCP / UDP   |
                 --------------
      layer 3   |      IP      |
                 --------------
      layer 2   |  data link   |
                 --------------
      layer 1   |   physical   |
                 --------------

How many real networks do you know using the exact 7 layer OSI model?

Ramin

> Antony.

