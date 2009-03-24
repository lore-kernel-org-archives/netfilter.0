From: Kai Wang <w2w2k2k2@gmail.com>
Subject: getsockopt with SO_ORIGINAL_DST failed with ENOENT
Date: Tue, 24 Mar 2009 10:30:55 +0800
Message-ID: <8b129cf50903231930w2ae78d73g49750426bb825f1a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=i4pShCPZa7SEne0gOhTA2hOU96D2q8E4ZEtvtm6be0U=;
        b=n930r2u27DFXjo8htdn/Z285RdKjoaxxKCx2FUSWG37dVm8QdwjugkgcA9yR/pfYt4
         RTmaHknQnEemHp5Os2pyCAHkW7E/qgaQwzkwLxOt2s40+CTAp7JtQO5ZP71J93M9HMG9
         FDn0ja8mVvEOHRgavWh+MPjVLbxDBOZDyQc2o=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

[Seems the same mail I sent yesterday had some formatting error, so
send it again. Sorry for spam...]

Hi everyone,

I'm new to iptables and recently met a problem when trying to get
original IP address with getsockopt.

I'm using iptables 1.3.3 on linux 2.6. Here's the rule:
iptables -t nat -A OUTPUT -m owner  --uid-owner <my_user_name>  -p tcp
-d 10.0.0.0/8 -j REDIRECT --to-port 9000

It will redirect all tcp packages to my proxy process listening on
9000 port. And my proxy will handles the real connection with out
world.
Here's my code snippet of my proxy app to get the original destination address:

struct sockaddr_in addr;
socklen_t addr_sz = sizeof(addr);

bzero(reinterpret_cast<char*>(&addr), addr_sz);
addr.sin_family = AF_INET;

if (getsockopt(fd, SOL_IP, SO_ORIGINAL_DST, &addr, &addr_sz) != 0) {
  int err = errno;
  LOG << "Couldn't read SO_ORIGINAL_DST from socket " << fd
            << " Detail: " << strerror(err);
  return false;
}

For most connections this works well. But it randomly returns -1 and
gives ENOENT errno: "No such file or directory"...
I totally don't know why or in which condition this will happen. Could
anyone enlighten me?

Thanks in advance!
--
Best Regards!
Kai Wang
