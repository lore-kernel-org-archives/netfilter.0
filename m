From: "Johannes Walch" <j.walch@nwe.de>
Subject: Re: What ports need to be open to allow for mail?
Date: Thu, 10 Apr 2003 12:42:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003b01c2ff4d$eb5d2530$5863a8c0@note>
References: <20030410093951.97924.qmail@web40207.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030410093951.97924.qmail@web40207.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

> Hello All,
>
> I'm trying to set up my mail server; however I want to
> make sure that I have the correct port(s) open. I
> already have TCP port 25 open; however do I also have
> to have UDP port 25 open as well? Any help would be
> appreciated.
>
> Thanks,
> James

If you want to run SMTP (the standard case) with your mail server port
25/TCP ist sufficient. Port 25/UDP is not used by sendmail or any other SMTP
server software (as far as I know).

johannes walch


