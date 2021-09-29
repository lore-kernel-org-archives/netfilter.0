From: Cristian Constantin <const.crist@googlemail.com>
Subject: upper limit on number of ip addresses in an NFNL_SUBSYS_NFTABLES<<8|NFT_MSG_NEWSETELEM
 message
Date: Wed, 29 Sep 2021 16:06:23 +0200
Message-ID: <CANCV4NNc+FETTN5t+qQqSVugJBGAQJebiCHSDX9iHqUvJUtU0w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=1TcXKa38uHJu4zyMa/iwhqiMzozoSaoAc8Gc8xFLCUQ=;
        b=kjX3u4KZxDMjcfjKL43g0Fkh85EOyksiTfPY9QiOwOHkwGYT1evjc8XDOiVoZmp2xu
         rEBBGsCGpSGwPUCO/NwRJ0lYGu5qBVAc6A1Gi7oz+FO8fhiytiHg+o8t44zu1RjFfIK7
         dYTSD5Rn+oV623gLWvJHbYescuKWUbK8JbaOMxHOTyEsPJe6RkmUK8VBNsCJ8xGxglAc
         3KcHmpvwam4MUeD3lRdFVeyR/rNIPMu2798TdqFWYhcjw/pk33C+wV0PDzZRnDWN1AEc
         M7SFl+kc7d+W7RXqC40ZoupizH/0xdA2uSeYuShap8LyHquXiwhZlEVNFOXx0qkML0H3
         5iuQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi!

suppose new ip addresses are added to nft set using a message of type:

NFNL_SUBSYS_NFTABLES<<8|NFT_MSG_NEWSETELEM

over netlink sockets; e.g. (from an strace capture):

sendmsg(7, {msg_name={sa_family=AF_NETLINK, nl_pid=0,
nl_groups=00000000}, msg_namelen=12, msg_iov=[{iov_base=[{{len=20,
type=NFNL_MSG_BATCH_BEGIN, flags=NLM_F_REQUEST, seq=1112598292,
pid=2460867}, {nfgen_family=AF_UNSPEC, version=NFNETLINK_V0,
res_id=htons(10)}, {{len=28732,
type=NFNL_SUBSYS_NFTABLES<<8|NFT_MSG_NEWSETELEM,
flags=NLM_F_REQUEST|NLM_F_ACK|NLM_F_CREATE, seq=1112598293,
pid=2460867}, {nfgen_family=AF_INET, version=NFNETLINK_V0,
res_id=htons(0), [{{nla_len=13, nla_type=0x2},
"\x68\x6f\x6e\x65\x79\x6e\x65\x74\x00"}, {{nla_len=8, nla_type=0x4},
"\x00\x00\x00\x02"}, {{nla_len=11, nla_type=NFNETLINK_V1},
"\x66\x69\x6c\x74\x65\x72\x00"}, {{nla_len=28676,
nla_type=NLA_F_NESTED|0x3},
"\x1c\x00\x01\x80\x0c\x00\x01\x80\x08\x00\x01\x00\x23\x9c\x55\x4b\x0c\x00\x04\x00\x00\x00\x00\x00\x05\x26\x5c\x00\x1c\x00\x02\x80"...}]},
{{len=20, type=NFNL_MSG_BATCH_END, flags=NLM_F_REQUEST,
seq=1112598294, pid=2460867}, {nfgen_family=AF_UNSPEC,
version=NFNETLINK_V0, res_id=htons(10)}], iov_len=28772}],
msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 28772

what limits the number of ip addresses which can be pushed, using one
write on the socket to the kernel nft set?

a. the socket write buffer itself
b. some kind of netlink specific limit; how to detect it automatically?

thanks,
cristian
