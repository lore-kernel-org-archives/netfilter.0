From: Martin Josefsson <gandalf@wlug.westbo.se>
Subject: RE: How to block a range of IPs?
Date: 27 Apr 2003 12:42:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051440156.5938.118.camel@tux.rsn.bth.se>
References: <000101c30c8e$1d885870$0200a8c0@klintan.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000101c30c8e$1d885870$0200a8c0@klintan.local>
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
To: Michael K <micke@klintan.se>
Cc: 'Afshin Lamei' <linux_st@hotmail.com>, Netfilter <netfilter@lists.netfilter.org>

On Sun, 2003-04-27 at 09:25, Michael K wrote:
> > -----Original Message-----
> > From: netfilter-admin@lists.netfilter.org 
> > [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Afshin Lamei
> > Sent: Sunday, April 27, 2003 8:12 AM
> > To: netfilter@lists.netfilter.org
> > Subject: How to block a range of IPs?
> > 
> > 
> > Hi,
> > How can I write a rule for a custom range of IPs? for 
> > example, I want to 
> > block every WWW packet incoming from eth1, which source is an 
> > IP between 
> > 192.168.1.10 and 192.168.1.20.
> > please help me writing an example.
> > thank you
> > afshin
> > 
> > 
> 
> You can't, but if you subnet, the closest will be 192.168.1.1 to
> 192.168.0.14 using mask 255.255.255.240.
> Or 192.168.1.1 to 192.168.0.30 using mask 255.255.255.224.

Actually you can... with the new iprange match in patch-o-matic.

-- 
/Martin

