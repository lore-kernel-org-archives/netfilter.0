From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Listening ports.
Date: Mon, 23 Sep 2002 20:22:33 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209232021160.5825-100000@dns.toxicfilms.tv>
References: <000001c2632b$ab4b0840$6601a8c0@s3ac>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c2632b$ab4b0840$6601a8c0@s3ac>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rowan Reid <rreid@studio3arc.com>
Cc: netfilter@lists.netfilter.org

> Is there a way to list listening ports per interface .. ? Or IP would be
> better.
Let's see, try:
netstat -ntlp | grep <your.ip> | less -n

You can omit the less thingy, will work anyway :)

Regards,
Maciej Soltysiak




