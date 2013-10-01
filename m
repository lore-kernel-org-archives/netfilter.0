From: tristen <tristen_e@yahoo.com>
Subject: statistic mode / every nth / packet problem
Date: Tue, 1 Oct 2013 06:02:13 -0700 (PDT)
Message-ID: <1380632533.32003.YahooMailNeo@web162406.mail.bf1.yahoo.com>
Reply-To: tristen <tristen_e@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1380632533; bh=B2sqP2ON7TVnpDTEh7/263GBSzYTseTHCJ7g5EBy43Y=; h=X-YMail-OSG:Received:X-Rocket-MIMEInfo:X-Mailer:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=Xp0M1VTF7nvkBqT6UWodR84IXYDc1waej4rp05ETEme12y+zl5m/0Bioj0JVv+MeD9M7D/OvT6eYtaHP2VXceAhT0PtpWIhPBxWuxpCQK2dmol2zZgY7dUm4oFeS8f1ibkp7tj9gAMjSf5ffMSCQVT3qo3tBFgL1m0J2JuxIzBs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

hello

i have a situation where i want to round-robin new http connections to different ports, but i'm finding that the following is resulting in a significant amount "falling through" to my catch-all on port 9000, rather than being evenly distributed across 8080-8084.

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -P INPUT ACCEPT
iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 0 -j REDIRECT --to-port 8080
iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 1 -j REDIRECT --to-port 8081
iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 2 -j REDIRECT --to-port 8082
iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 3 -j REDIRECT --to-port 8083
iptables -t nat -A PREROUTING -p tcp --dport 80 -m statistic --mode nth --every 5 --packet 4 -j REDIRECT --to-port 8084
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 9000

it's about 80-20, where 80% are evenly distributed amongst 8080-8084 and 20% are winding up on 9000.

i'd prefer 100% evenly distributed on 8080-8084 and none on 9000. i put 9000 there as a catch-all "hack" because i found connections were failing to be caught by the 8080-8084 range.

any help would be really appreciated, thank you in advance!

tristen
