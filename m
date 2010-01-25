From: Alessandro Vesely <vesely@tana.it>
Subject: Re: How to create rule from log file information ?
Date: Mon, 25 Jan 2010 19:48:55 +0100
Message-ID: <4B5DE797.4070801@tana.it>
References: <20100125230202.60f24a5a@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100125230202.60f24a5a@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 25/Jan/10 18:32, J. Bakshi wrote:
> I have collected the iptables log against nmap scan. Like
>
>[omitted almost identical log lines]
>
> Can I make rule-set to prevent the above scan from the info collected at the log ?
> Kindly enlighten me. Then I can make more rule sets from the log.

I'm not an nmap expert, but AFAIK nmap is designed to avoid just that. 
I have installed some logging iptables rules, similar to the ones in 
your previous message (from Arno's iptables scripts, IIRC) and 
sometimes some of them fire, presumably because inappropriate flags 
had been given to nmap.

To recognize a scan, one may look at almost simultaneous TCP syn 
occurring to several nearby ports/ addresses, and not followed by an 
ack. This would require specific connection tracking code that I've 
never heard about. At any rate, you /have/ to respond to syn requests, 
because they may be legit. You may recognize that they were scans by 
analyzing the logs some time later, presumably for banning the 
relevant IPs from further accessing your server...

HTH
