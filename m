From: Thomas Luening <toml@thlu.de>
Subject: Re: Explanation of 2 Rules
Date: Wed, 26 Aug 2020 18:01:05 +0200
Message-ID: <c44a47f2-1de8-8a70-b31d-fa92b2547881@mail>
References: <416b36ac-c17f-0ccd-3d28-cf8e4f3372ae@mail>
 <96ccc7de-4de4-e01f-2270-a1238b4cff1a@mail>
 <c9f61216-e333-6551-e98e-8a5ce015f248@plushkava.net>
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c9f61216-e333-6551-e98e-8a5ce015f248@plushkava.net>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

Hi Kerin, hi David

Am 26.08.20 um 08:49 schrieb kfm@plushkava.net:
> Your interpretation appears correct to me.

Thank you for your Answer! :-)

> 
> /*           sNO, sSS, sSR, sES, sFW, sCW, sLA, sTW, sCL, sS2   */
> /*synack*/ { sIV, sIV, sSR, sIV, sIV, sIV, sIV, sIV, sIV, sSR },

That was a great help, but it is really heavy stuff. It's hard to work through these tables and to understand them in context. 
While testing I found that the xmas-statement is a rather weak protection, because it seems to check for an explicit match of 
all given flags. If I use the flags in various combinations...

nmap 10.0.1.200 --scanflags "URG ACK PSH RST SYN FIN" -p 631

...it is noticeable, that some Packages was not recognized at all. But the check for 'invalid' was always successful. 
Conclusion: The xmas-statement is not a good choice.

I believe that the problem can be closed. Thanks again for your help.

Best Regards, Tom
