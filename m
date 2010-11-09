From: Ilo Lorusso <sneak147@gmail.com>
Subject: Re: port based routing - help with tcpdump
Date: Tue, 9 Nov 2010 18:34:57 +0200
Message-ID: <AANLkTikTJqQj7ARSbr4XrK6oUwQiZDQmQjBUuSR6u3yG@mail.gmail.com>
References: <AANLkTik6E8KDgN8S+J952ULLpzUjy2yAY9oNA1jv+ZEJ@mail.gmail.com>
	<4CD7CD88.6010100@plouf.fr.eu.org>
	<AANLkTimeCfv9i13L9PFpOxTRbzG4c4Qpa7XO5quK2CEY@mail.gmail.com>
	<AANLkTikRY6mYY5fAAN4Ey-BaOQSOiXtx-StUejyQGG+x@mail.gmail.com>
	<4CD97137.5000706@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=zatUM1WjXrESzrVSYj6pXLu/O2E+3FGyphFSWcUGH7k=;
        b=rVSG18y7l4E5hNBkjaDqEyxR4AaB2K6Vw3jl3/8rO01pHOq2oRiTiqkfH8w4hSevRw
         dfLFvbN82hXM3VwzpV4wKm8Mme+Fy62L0uAJGhsKWrqn9WTOq0GlHq5wBzYGSCTCTNHQ
         0j3IcHzAxKNkFeYtqvheD8Clx8ZYiCHzZBLLA=
In-Reply-To: <4CD97137.5000706@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

Yes I can see the traffic coming back when I do a tcpdump...

you can see  172.69.128.107 access 74.125.79.104.http and then
74.125.79.104.http  talks back to 172.69.128.107 ,
now this is encapsulated in a GRE tunnel as my alt interface is a GRE
tunnel but it works for the local box.. as per my previous post a
couple days ago...



below is the sample of the tcpdump,

18:26:21.722567 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
172.69.128.107.elatelink > 74.125.79.104.http: Flags [S], seq
224859509, win 65535, options [mss 1460,nop,nop,sackOK], length 0
18:26:21.982269 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.982316 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.983569 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.983597 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.984834 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.984858 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.986352 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.986374 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.988881 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.988904 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.990462 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.990485 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.991905 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.991929 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.994654 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.994688 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.996482 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.996507 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.997861 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.997885 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.999130 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:21.999153 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.000445 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.000467 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.001692 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.001714 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.002989 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.003012 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.004233 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.004255 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.005617 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.005640 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.006876 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.006921 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.008526 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.008557 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.011507 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.011532 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.013672 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.013695 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.014960 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.014986 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.016381 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.016404 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.017907 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.017934 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.019239 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.019263 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.021600 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.021625 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.022862 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.022911 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.024111 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.531715 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.531759 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.533097 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.533133 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.534376 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.534402 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.535716 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.535739 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.536991 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.537015 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.538242 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.538266 IP 172.69.128.98 > 57.24.98.42: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0
18:26:22.539501 IP 57.24.98.42 > 172.69.128.98: GREv0, length 52: IP
74.125.79.104.http > 172.69.128.107.elatelink: Flags [S.], seq
192453115, ack 224859510, win 5720, options [mss 1380,nop,nop,sackOK],
length 0



On Tue, Nov 9, 2010 at 6:05 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Ilo Lorusso a =E9crit :
>>
>> im having simalar problem , i set the below up for traffic that gets
>> forward though my linux box..
>> I can see the traffic returning though the alternate interface yet t=
he
>> port does not connect..
>>
>> I have turned of RP_filtering on all my interfaces and there is are =
no
>> conflicting Deny statements on my iptables .. is there anything else
>> that I would cause this?
>
> With tcpdump, can you see the return traffic going out the LAN interf=
ace
> ? If no, can you "see" it in the FORWARD chain (insert a LOG rule at =
the
> beginning of the chain) ?
>
