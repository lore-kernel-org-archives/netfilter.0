From: Rodrigo Senra <rodsenra@gpr.com.br>
Subject: Re: benchmark tool for netfilter - any recommendations ?
Date: Tue, 18 Jun 2002 14:38:31 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020618173742.0A9931B40BF@taipe.terra.com.br>
References: <1024402282.591.20.camel@xbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <1024402282.591.20.camel@xbox>
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
To: netfilter@lists.samba.org

|On 18 Jun 2002 14:11:22 +0200
|"Filip Sneppe (Cronos)" <filip.sneppe@cronos.be> wrote
| about benchmark tool for netfilter - any recommendations ?:

>> Hi,
> 
> I am looking for a traffic generator type aplication that can
> generate a realistic workload to test a netfilter firewall.

 We are building a tool for such goal. It is based in libnet.
 We parse several parameters such as: Protocol distribution (X% HTTP,
 Y% FTP, Z%H.323, etc), connection burst or not, num packets, etc
 Then we build in-memory descriptors of the traffic, to later dump
 full packets to the table. A second machine is prepared behind the
 firewall to answer part of the traffic in order to activate contrack
 mechanism of a netfilter/iptables firewall in between. 

 Is this what you were looking for ? It should be finished in early july.
 I do not know yet if my boss will allows us to release it as open source.
 If so I'll announce it here, otherwise get in thouch with us by then that
 I'll read the price tag for you ;o)

 best regards
 Senra 

-- 
Rodrigo Senra         
MSc Computer Engineer   (GPr Sistemas Ltda)     rodsenra@gpr.com.br 
http://www.ic.unicamp.br/~921234  (LinUxer 217.243) (ICQ 114477550)

