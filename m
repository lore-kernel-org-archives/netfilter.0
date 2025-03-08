Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBED518A95A
	for <netfilter@vger.kernel.org>; Sat,  8 Mar 2025 10:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741428859; cv=none; b=BZITI8aU661/rX2vuxqmJ3hhRAS7VokFWOmapW7JLsbmnAHhN5/Y+7py4JK+k/mPtO23SrpsmqUgOK7d19d0Mag7ut/czgk4Xwp5yPT3Vd8QSJd612cwyIfH+vf9tzf/4joTroDpq/wFyNuIkrkbP8rnQJhNXtoms5VnWyv6JtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741428859; c=relaxed/simple;
	bh=Keu+aicjWdmfp/2kms6Wdoz6bD/J3P/pE1B+DTe9boM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=ToMz049FGiNLHGJdf7h5DYCNxUSWME/Q/cyxl/V4L7+FxcRCUMpmP5p7ftXtqU08kZns2W3RBwyg1rkW2sQkAeSGoHfW7ehnCsNjIVuM2PrdWUz9cCIpi0vBhrY6NdCHLSt976x7U/JfpJES83ZkcX1sqTWhvjU/C31eImL3EXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=mm6y/YLa; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=F7zlIrEQ; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="mm6y/YLa";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="F7zlIrEQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:From:
	Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:Message-Id;
	bh=Mkt0Ea9+Mq8HJnvs3Tgo2e5dDlOgQRhtKKIwKSAuxzs=; t=1741428855; x=1742638455; 
	b=mm6y/YLaeEqgRrHhxawaOn6CI0j6862ghVvlpYunJtfENJLZrkiSyGITZ3slelVYeSvdK3UBq+L
	/uGmN4bEOipFoBsvo99J5fjvSfKo6+uItwIeNmZ9GWn2d6YELKOIQTbGOm2/+J9OmzX/D7HuOkUeN
	M4gkPmbNEI9LICCri+U=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From
	:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:
	Message-Id; bh=Mkt0Ea9+Mq8HJnvs3Tgo2e5dDlOgQRhtKKIwKSAuxzs=; t=1741428855;
	x=1742638455; b=F7zlIrEQ9ahCMwfJnQ6sPelG8zX1BhACwur7Ghzsa0hADo+5CyoVDU7VA3r6Q
	6k7xM+OqKhpnak/CCJrs8AyBQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tqrC2-002KQT-2a
	for netfilter@vger.kernel.org;
	Sat, 08 Mar 2025 11:14:07 +0100
Date: Sat, 8 Mar 2025 11:14:05 +0100
From: Slavko <linux@slavino.sk>
To: netfilter@vger.kernel.org
Subject: ulogd2, sqlite3 and negative TCP Seq numbers
Message-ID: <20250308111405.441477a1@bonifac.skk>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAFVBMVEX7+/xrTUz4//3Ozc10AAH5/v3///8f7tJ8AAAB2UlEQVQ4jW2STY6EIBCFSwmumykPQDTtGqxO74kcgNiJa8dE7n+EAfzBtONCpD5eVfko8Pszeb+sflqOPVyA535abyB+9wnfwMgek/8XFEO33sE6lYWB/8HLqOUOFre87H+g9LK2P7y6p+o+1mJ1B75j1g7VeFeshTXifbfEza+goAqqLyAhAKsC+QahqVD9o74VYxGB6PUBJl+C5FwCUhEUSEpCM41PmGYJABK07oNk0EQQAw54K9KDGAQhl6C4ewDwJnZjjVZptQaD0PQSOqC4R2x0Btg76HwbI5oE1Rt4WUPhvG9cjAht+00SvlD5JThQQYiY2g6s3oBRzXMzgG1nKS2asDr+HPb0aSGmsiWwS9r4+rxP0M1tkgxQW/PzewF+pqPKgEV1cbdiCQxUB+AyaJzeq5AmfQG+IEwtDSTwIU8ArtBCtSKYpEg/lhNwFnwYGi2I3qRhPkGpYx5kmmBqtcrgg5hcUrxhqBicoNh6wnB11vaXP/8lkSYkeYaan4CJV7RQVtFm88jAxSlE8M85XonKgM91qBwtmnVt+1z86eI1+/3OMLc7tgbV5k1IhtndMnS/j6x3dAEciB/D7VuVwQI5Po9h1E7Au/kkq89gKt3ziMu1SuAPWe5Dq/EEywcAAAAASUVORK5CYII=
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/9=V=OYfLS.ah_=KZZdUz.a9"

--MP_/9=V=OYfLS.ah_=KZZdUz.a9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

i use SQLite for storing long for some years, yesteday i decided to
extend its schema to log more fields, beside others to log tcp.seq and
i noticed negative sequence numbers in DB, eg.:

    dt                   ip_saddr_str   tcp_seq    
    -------------------  -------------  -----------
    2025-03-08 08:14:56  47.83.121.132  -1689958912

As i log the same packet to file too, it is logged as:

    Mar  8 08:14:56 ... SRC=47.83.121.132 ... SEQ=2605008384 ...

I log them by two stacks:

    stack=log1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,print1:PRINTPKT,emu1:LOGEMU
    stack=log1:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,mac2str1:HWHDR,sqlite3_pkt:SQLITE3

Not all are logged as negative, i collet (and pair) all yet logged:

    LOGEMU         SQLITE3
    3489577139 -> -805390157
    2446884710 -> -1848082586
    2407497113 -> -1887470183
    2328509367 -> -1966457929
    3828861668 -> -466105628
    2350061741 -> -1944905555
    2605008384 -> -1689958912
    2552571305 -> -1742395991
    2617767003 -> -1677200293

(i don't see any pattern in it, but i am not experienced with
signed/unsigned numbers).

While investigating these tcp.seq, i noticed the same happens with
tcp.ackseq (only much less packets logged, as most are initial SYN
only).

Initially i think, that i did some mistake in schema (yes it is really
hard in SQLite :-)), but to be sure (full table schema attached):

    sqlite3 ulogd.db .schema | grep tcp_seq
             tcp_seq         INT,

I checked, that SQLite itself is not reason, i tried to cast 2605008384
value to INT in sqlite3 shell tool and insert it into table without any
problems (in memory DB):

    sqlite> SELECT CAST(2605008384 as INT);
    2605008384

    sqlite> CREATE TABLE test (val INT);
    sqlite> INSERT INTO test VALUES (2605008384);
    sqlite> SELECT * FROM test;
    2605008384

It is SQLite 3.40.1 and ulogd2 2.0.8 (for now patched with ARP
attempts) on debian stable.

It is not new DB file, i migrated it from old schema (and copied old
values into new schema, previously i log 21 fields, now it is 51
fields), can it be reason? To be honest, it was my first attempt to
migrate existing SQLite table into new schema, but i don't see anything
wrong in it.

Please, what is/can be wrong? 

regards

-- 
Slavko
https://www.slavino.sk

--MP_/9=V=OYfLS.ah_=KZZdUz.a9
Content-Type: application/sql
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=ulogd.sql

Q1JFQVRFIFRBQkxFIElGIE5PVCBFWElTVFMgInVsb2dfcGt0IiAoCiAgICBvb2JfdGltZV9zZWMg
ICAgSU5ULAogICAgb29iX3RpbWVfdXNlYyAgIElOVCwKICAgIG9vYl9wcmVmaXggICAgICBURVhU
LAogICAgb29iX2luICAgICAgICAgIFRFWFQsCiAgICBvb2Jfb3V0ICAgICAgICAgVEVYVCwKICAg
IG9vYl9tYXJrICAgICAgICBJTlQsCiAgICBvb2JfZmFtaWx5ICAgICAgU01BTExJTlQsCiAgICBv
b2JfcHJvdG9jb2wgICAgU01BTExJTlQsCiAgICBvb2JfaG9vayAgICAgICAgU01BTExJTlQsCiAg
ICBvb2JfdWlkICAgICAgICAgSU5ULAogICAgb29iX2dpZCAgICAgICAgIElOVCwKCiAgICByYXdf
bGFiZWwgICAgICAgU01BTExJTlQsCiAgICByYXdfcGt0bGVuICAgICAgSU5ULAogICAgcmF3X3R5
cGUgICAgICAgIFNNQUxMSU5ULAoKICAgIG1hY19zYWRkcl9zdHIgICBURVhULAogICAgbWFjX2Rh
ZGRyX3N0ciAgIFRFWFQsCgogICAgaXBfc2FkZHJfc3RyICAgIFRFWFQsCiAgICBpcF9kYWRkcl9z
dHIgICAgVEVYVCwKICAgIGlwX3Byb3RvY29sICAgICBTTUFMTElOVCwKICAgIGlwX3R0bCAgICAg
ICAgICBTTUFMTElOVCwKICAgIGlwX3RvdGxlbiAgICAgICBJTlQsCiAgICBpcF9pZCAgICAgICAg
ICAgSU5ULAoKICAgIGlwNl9wYXlsb2FkbGVuICBJTlQsCiAgICBpcDZfaG9wbGltaXQgICAgU01B
TExJTlQsCiAgICBpcDZfZmxvd2xhYmVsICAgSU5ULAogICAgaXA2X2ZyYWdpZCAgICAgIElOVCwK
ICAgIGlwNl9uZXh0aGRyICAgICBTTUFMTElOVCwKCiAgICB0Y3Bfc3BvcnQgICAgICAgSU5ULAog
ICAgdGNwX2Rwb3J0ICAgICAgIElOVCwKICAgIHRjcF9zZXEgICAgICAgICBJTlQsCiAgICB0Y3Bf
YWNrc2VxICAgICAgSU5ULAogICAgdGNwX3dpbmRvdyAgICAgIElOVCwKICAgIHRjcF9hY2sgICAg
ICAgICBTTUFMTElOVCwKICAgIHRjcF9zeW4gICAgICAgICBTTUFMTElOVCwKICAgIHRjcF9maW4g
ICAgICAgICBTTUFMTElOVCwKICAgIHRjcF9yc3QgICAgICAgICBTTUFMTElOVCwKICAgIHRjcF9w
c2ggICAgICAgICBTTUFMTElOVCwKICAgIHRjcF91cmcgICAgICAgICBTTUFMTElOVCwKCiAgICB1
ZHBfc3BvcnQgICAgICAgSU5ULAogICAgdWRwX2Rwb3J0ICAgICAgIElOVCwKICAgIHVkcF9sZW4g
ICAgICAgICBJTlQsCgogICAgc2N0cF9zcG9ydCAgICAgIElOVCwKICAgIHNjdHBfZHBvcnQgICAg
ICBJTlQsCgogICAgaWNtcF90eXBlICAgICAgIFNNQUxMSU5ULAogICAgaWNtcF9jb2RlICAgICAg
IFNNQUxMSU5ULAogICAgaWNtcF9lY2hvaWQgICAgIElOVCwKICAgIGljbXBfZWNob3NlcSAgICBJ
TlQsCgogICAgaWNtcHY2X3R5cGUgICAgIFNNQUxMSU5ULAogICAgaWNtcHY2X2NvZGUgICAgIFNN
QUxMSU5ULAogICAgaWNtcHY2X2VjaG9pZCAgIElOVCwKICAgIGljbXB2Nl9lY2hvc2VxICBJTlQK
KTsK

--MP_/9=V=OYfLS.ah_=KZZdUz.a9--
