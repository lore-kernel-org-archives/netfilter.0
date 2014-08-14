From: tomekx1000 <tomekx1000@lutel.pl>
Subject: nftables and FTP connection tracking
Date: Thu, 14 Aug 2014 11:29:57 +0200
Message-ID: <4ae8314bdfec48fe944b03977bb140ff@lutel.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lutel.pl; h=
	user-agent:message-id:subject:subject:from:from:date:date
	:content-transfer-encoding:content-type:content-type
	:mime-version:received; s=key; t=1408008597; bh=IRNun/O1J81JPljQ
	iUwZCDF/7xAxp/UPjo+IB9465YQ=; b=YTXRjVmDQMwDHE5dd3xGLuroDL8VGAin
	uRxqqtlT+/S1ikhZfssS7/gWfcHkKhPbhj6wxe56X2YzyrDopYKuG8FtUSTWEIM1
	V91wkKwVbIfaZhn2rWFbCsdcw9jbbp9nwOrUXoshmAelkZmyQRpFHpaC6AijvSvB
	BiX8Xt+WReE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Dear All,

Could you have a look at my simple nft firewall script below, I've used 
ct related, established, but it doesnt work with passive mode FTP - the 
data session on high ports is dropped by firewall. Does NFTables have 
connection tracking helper for FTP? If not - is it planned in foreseable 
future to add it?

table ip filter {
  chain input {
  type filter hook input priority 0;
  dport {21} ct state new limit rate 2/second counter accept
  ct state {established, related} counter accept
  counter limit rate 100/second log group 2 prefix "RULE=Default drop"
  counter drop
  }

  chain output {
  type filter hook output priority 0;
  ct state {established, related} counter accept
  }

}
