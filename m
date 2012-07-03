From: Julien Vehent <julien@linuxwall.info>
Subject: Re: module order: tcp/conntrack vs. conntrack/tcp
Date: Mon, 02 Jul 2012 21:57:45 -0400
Message-ID: <6b9bf8d2fbee67290e206ae8bef72242@njm.linuxwall.info>
References: <9bfb14742a7ec35d775699fc955f437b@localhost>
 <alpine.LNX.2.01.1207021414160.9210@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=linuxwall.info; h=
	mime-version:content-type:content-transfer-encoding:date:from:to
	:cc:subject:in-reply-to:references:message-id; s=lnw-dkim; bh=H1
	SKRFkAVUer2+J0yN8h50xeG7MKm+bh7Kea0LF0r7k=; b=ZxNm6A3C4I4sehXkmv
	YPRW+6ANOQ6bdHAvxZP6759f4ic1HoEkTRRCzPQi9j/4pUQhJcjrLy5tmYWARt5R
	Kguq46Y6DvXrAs4+Rw3Czp98ndqsML6K+0tyhUh+4MKImAPAKGMXlpAi6Ve1W5Go
	00L2G7lHNH8VBL0cHIa00ULyg=
In-Reply-To: <alpine.LNX.2.01.1207021414160.9210@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org

On 2012-07-02 8:16, Jan Engelhardt wrote:
> The use of -m conntrack (state is obsolete) is cheaper than people
> think, because the ct belonging to a packet is already long determined,
> so looking at the state is quite simple.

I just discovered that -m state is obsolete. There not much to read about -m 
conntrack on the mailing lists (this one or the dev one). Would you care the 
elaborate on the advantages of the conntrack module as opposed to the state 
one ?

Should we also stop using -p, -s, -d, --sport and --dport and replace them 
with the equivalents in the conntrack module ?

conntrack match options:
[!] --ctstate {INVALID|ESTABLISHED|NEW|RELATED|UNTRACKED|SNAT|DNAT}[,...]
                                State(s) to match
[!] --ctproto proto            Protocol to match; by number or name, e.g. 
"tcp"
[!] --ctorigsrc address[/mask]
[!] --ctorigdst address[/mask]
[!] --ctreplsrc address[/mask]
[!] --ctrepldst address[/mask]
                                Original/Reply source/destination address
[!] --ctorigsrcport port
[!] --ctorigdstport port
[!] --ctreplsrcport port
[!] --ctrepldstport port
                                TCP/UDP/SCTP orig./reply source/destination 
port
[!] --ctstatus {NONE|EXPECTED|SEEN_REPLY|ASSURED|CONFIRMED}[,...]
                                Status(es) to match
[!] --ctexpire time[:time]     Match remaining lifetime in seconds against
                                value or range of values (inclusive)
     --ctdir {ORIGINAL|REPLY}   Flow direction of packet


Thanks,
Julien

-- 
Julien Vehent - http://1nw.eu/!j
