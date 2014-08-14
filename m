From: tomekx1000 <tomekx1000@lutel.pl>
Subject: Re: nftables and FTP connection tracking
Date: Thu, 14 Aug 2014 20:38:45 +0200
Message-ID: <06f3d3ac9dd206b0b8811f923f6a4346@lutel.pl>
References: <4ae8314bdfec48fe944b03977bb140ff@lutel.pl>
 <20140814180205.GA5928@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lutel.pl; h=
	user-agent:message-id:references:in-reply-to:subject:subject
	:from:from:date:date:content-transfer-encoding:content-type
	:content-type:mime-version:received; s=key; t=1408041525; bh=mIg
	yndz350dJzMTrIoMTfaHbc1gGh3kf+GE5To1rBNM=; b=LVM9sMSu8yqRk/aV2mt
	llSCe2WkZw3MGENXAXN9JNB7bw3GDq5dmZqO19+gPS6AHI4P6IxTCDjjBi3rNTMK
	Hl3PvHK2+DjLCNJzAICGRvDBPTUT4dM8pDIYsuHMjjHP/GvziIB0F41K7qC/5ZCa
	07WPAtAb1QeokWjhR0GN+m5k=
In-Reply-To: <20140814180205.GA5928@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Thank you Pablo for clarification on usage of brackets. I've updated=20
script, however still no joy when connecting to server FTP. Maybe i'm=20
missing some modules?

# lsmod | grep conn
nf_conntrack_ftp 7059 1 nf_nat_ftp
nf_conntrack_ipv4 8066 19
nf_defrag_ipv4 1235 1 nf_conntrack_ipv4
nf_conntrack 55929 5=20
nf_nat_ftp,nf_nat,nft_ct,nf_conntrack_ftp,nf_conntrack_ipv4

Here is the corrected script:
table filter {

    chain input {
       type filter hook input priority 0;
       tcp dport 21 ct state new counter accept
       ct state related counter accept
       ct state established counter accept
       counter limit rate 100/second log group 2 prefix "RULE=3DDefault=
=20
drop"
       counter drop
    }

   chain output {
       type filter hook output priority 0;
        ct state established, related counter accept
    }

}

After connecting to port 21, FTP servers tries to negotiate data=20
connection on high ports, and this new connection is dropped...
How can I make FTP helper to work with nftables?


W dniu 20:02 14-08-14, Pablo Neira Ayuso napisa=C5=82(a):

> On Thu, Aug 14, 2014 at 11:29:57AM +0200, tomekx1000 wrote:
>=20
>> Dear All, Could you have a look at my simple nft firewall script=20
>> below, I've used ct related, established, but it doesnt work with=20
>> passive mode FTP - the data session on high ports is dropped by=20
>> firewall. Does NFTables have connection tracking helper for FTP?
>=20
> Yes, no changes in that regard.
>=20
>> If not - is it planned in foreseable future to add it? table ip filt=
er=20
>> { chain input { type filter hook input priority 0; dport {21} ct sta=
te=20
>> new limit rate 2/second counter accept
>=20
> The brackets have special meaning. If you uses brackets to wrap
> elements, the kernel will create a set for it with one single element=
=2E
> Better use the brackets when you have multiple elements. In this case=
,
> I suggest you to use:
>=20
> tcp dport 21 ...
>=20
>> ct state {established, related} counter accept
>=20
> ^ ^
>=20
> No need to use the brackets here:
>=20
> ct state established,related ...
>=20
> The ct state allows enumeration of several states using commas. This
> is due to the fact that ct state internally represents the states as =
a
> bitmask.
>=20
> You can check that use the describe command:
>=20
> # nft describe ct state
> ct expression, datatype ct_state (conntrack state) (basetype bitmask,
> integer), 32 bits
>=20
> pre-defined symbolic constants:
> invalid 0x00000001
> new 0x00000008
> established 0x00000002
> related 0x00000004
> untracked 0x00000040
>=20
> Basically, all bitmask types can use the comma-separated enumeration
> notation to combine the supported flags.
>=20
> You can use describe to inquire for other selectors in case of doubt.
