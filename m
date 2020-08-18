From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: Grammar in a bash script
Date: Tue, 18 Aug 2020 12:32:48 +0200
Message-ID: <6b77d800-f03f-5ddf-5f94-ffbef25b3050@thelounge.net>
References: <74c7c496-2429-8646-6c1a-9454169498ac@tiscali.it>
 <20200817085658.GA3677@salvia>
 <3e973ae0-55aa-eabb-adb2-9af5f2bea500@tiscali.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3e973ae0-55aa-eabb-adb2-9af5f2bea500@tiscali.it>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mario V Guenzi <jclark@tiscali.it>, Netfilter list <netfilter@vger.kernel.org>



Am 18.08.20 um 07:12 schrieb Mario V Guenzi:
> At first many thanks.
> another question given your kindness,
> I can use bash only to define my variables eg
> EXTIF = "eth0"
> LAN = "192.168.2.0/24"
> etc
> use the variables defined in writing the rules.nft file as per your
> example and then write
> nft -f /path/rules.nft in my bash script?

surely

how would nft know if you have written "rules.nft" by hand or from a
script? doing the same with generated bash scripts for years
