From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: How to create rule from log file information ?
Date: Mon, 25 Jan 2010 22:45:47 +0100
Message-ID: <4B5E110B.90507@chello.at>
References: <20100125230202.60f24a5a@infoservices.in> <4B5DE797.4070801@tana.it>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B5DE797.4070801@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 25.01.2010 19:49, netfilter-owner@vger.kernel.org wrote:
> On 25/Jan/10 18:32, J. Bakshi wrote:
>> I have collected the iptables log against nmap scan. Like
>>
>> [omitted almost identical log lines]
>>
>> Can I make rule-set to prevent the above scan from the info collected
>> at the log ?
>> Kindly enlighten me. Then I can make more rule sets from the log.
> 
> I'm not an nmap expert, but AFAIK nmap is designed to avoid just that. I
> have installed some logging iptables rules, similar to the ones in your
> previous message (from Arno's iptables scripts, IIRC) and sometimes some
> of them fire, presumably because inappropriate flags had been given to
> nmap.
> 
> To recognize a scan, one may look at almost simultaneous TCP syn
> occurring to several nearby ports/ addresses, and not followed by an
> ack. This would require specific connection tracking code that I've
> never heard about. At any rate, you /have/ to respond to syn requests,
> because they may be legit. You may recognize that they were scans by
> analyzing the logs some time later, presumably for banning the relevant
> IPs from further accessing your server...
> 

I have not tried them yet, but there is are extensions in
xtables-addons. Might worth trying:

 psd
       Attempt to detect TCP and UDP port scans. This match was derived
from Solar Designer's scanlogd.

       --psd-weight-threshold threshold
              Total weight of the latest TCP/UDP packets with different
destination ports coming from the same host to be treated as port scan
sequence.

       --psd-delay-threshold delay
              Delay (in hundredths of second) for the packets with
different destination ports coming from the same host to be treated as
possible port scan sub-
              sequence.

       --psd-lo-ports-weight weight
              Weight of the packet with privileged (<=1024) destination
port.

       --psd-hi-ports-weight weight
              Weight of the packet with non-priviliged destination port.

lscan
       Detects  simple  low-level scan attemps based upon the packet's
contents.  (This is different from other implementations, which also try
to match the rate
       of new connections.) Note that an attempt is only discovered
after it has been carried out, but this information can be used  in
conjunction  with  other
       rules  to  block  the  remote  host's  future connections. So
this match module will match on the (probably) last packet the remote
side will send to your
       machine.

       --stealth
              Match if the packet did not belong to any known TCP
connection (Stealth/FIN/XMAS/NULL scan).

       --synscan
              Match if the connection was a TCP half-open discovery (SYN
scan), i.e. the connection was torn down after the 2nd packet in the
3-way handshake.

       --cnscan
              Match if the connection was a TCP full open discovery
(connect scan), i.e. the connection was torn down after completion of
the 3-way handshake.

       --grscan
              Match if data in the connection only flew in the direction
of the remote side, e.g. if the connection was terminated after a
locally running daemon
              sent its identification. (E.g. openssh, smtp, ftpd.) This
may falsely trigger on warranted single-direction data flows, usually
bulk data transfers
              such as FTP DATA connections or IRC DCC. Grab Scan
Detection should only be used on ports where a protocol runs that is
guaranteed to do a bidirec-
              tional exchange of bytes.

       NOTE: Some clients (Windows XP for example) may do what looks
like a SYN scan, so be advised to carefully use xt_lscan in conjunction
with blocking rules,
       as it may lock out your very own internal network.


Best regards

Mart
