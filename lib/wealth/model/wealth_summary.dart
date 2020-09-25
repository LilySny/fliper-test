
class WealthSummary {
    WealthSummary({
        this.cdi,
        this.gain,
        this.id,
        this.profitability,
        this.total,
        this.hasHistory,
    });

    double cdi;
    double gain;
    int id;
    double profitability;
    int total;
    bool hasHistory;

    factory WealthSummary.fromJson(Map<String, dynamic> json) => WealthSummary(
        cdi: json["cdi"].toDouble(),
        gain: json["gain"].toDouble(),
        id: json["id"],
        profitability: json["profitability"].toDouble(),
        total: json["total"],
        hasHistory: json["hasHistory"],
    );

    Map<String, dynamic> toJson() => {
        "cdi": cdi,
        "gain": gain,
        "id": id,
        "profitability": profitability,
        "total": total,
        "hasHistory": hasHistory,
    };
}
